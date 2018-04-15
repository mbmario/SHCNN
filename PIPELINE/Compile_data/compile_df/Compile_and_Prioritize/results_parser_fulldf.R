# results_parser_CSV.R
# ORDER 1 of 3
# puts results folder into full data for Machine learning program
# modified from results_parser.R

# BEGIN PARAMETERS
setwd('/media/mario/DATAPART1/LIDC_total/uncompiled')

SH_max <- 400 # MAX SHS
SH_min <- 25  # MINIMUM THRESHOLD

filename_include <- TRUE # put filename as col 1
chars <-c("Subtlety", "Internal Structure", "Calcification", "Sphericity", "Margin", "Lobulation", "Spiculation", "Radiographic Solidity")
   # source for characteristics http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2176079/ 
nonSHcolumns <- c("key", "x_center", "y_center", "z_center", "patientlevel", "patient", "level", "volume", chars, "numSHs") # + malignancy  
# END PARAMETERS

# LOOKING FOR FILES/DIRS 
VCResultLines <- readLines('VCresult.txt')
   # Voxel Count Results aggregated text file
CAresult <- read.table('CAresult.txt', stringsAsFactors = FALSE)
   # Character annotators aggregated text file  
levels <- read.csv('levels.csv', stringsAsFactors = FALSE, strip.white=TRUE)
   # $filename, $distance, $patient, $level (level is patient-wise nodule association
SHfiles <- list.files(path="../SHs/", pattern = ".txt")
   # special output format
centers <- read.table('centers_nospaces.csv', sep=' ', stringsAsFactors = FALSE)

VClength <- max(length(VCResultLines)/2) # integer (first set 158)

# MAKE THE DATA FRAME
numcols = length(nonSHcolumns) + SH_max + 1 
full_df <- data.frame(matrix(0, nrow(CAresult), numcols))
names(full_df) <- c(nonSHcolumns, paste0(rep("SH", SH_max), 1:SH_max), "malignancy")
   # strings: key, patientlevel, volume
   # ints: patient, level, chars (8 by 1), numSHs
full_df$key <- as.character(full_df$key)
full_df$patientlevel <- as.character(full_df$patientlevel)
full_df$volume <- as.character(full_df$volume)

failed <- 0
i <- 0
for (i in 1:length(SHfiles)) {
   if (length(SHfiles[i]) != 0) { # SHfile found; changed from SHfiles
      SHlines <- readLines(paste0("../SHs/", SHfiles[i]))
      if (length(SHlines) > (SH_min + 10)) { # to do as little zero padding as possible
        
         # KEYS
         key <- substr(SHfiles[i],1, regexpr("_special", SHfiles[i])[1]-1)
         
         # VOXEL VOLUME  
         line <- VCResultLines[grep(paste0(key, ".hdr"), VCResultLines) + 1]
         temp <- substr(line, (regexpr("volume", line)[1])+7, nchar(line))
         volume <- substr(temp, 1, (regexpr(";", temp)[1])-1) 
         
         # CHARACTERISTICS, MALIGNANCY
         char_key <- paste0(substr(key, 1, regexpr("BINARY", key)[1] -2 ), "-char",
                   substr(key, regexpr("ROI", key)[1] + 3, nchar(key)), ".mat") #ex "LIDC-IDRI-0124-char-annotator-1-30.mat"
         char_index <- grep(char_key, CAresult$V1)
         chars <- c(CAresult$V2[char_index], CAresult$V3[char_index], CAresult$V4[char_index], CAresult$V5[char_index], 
                    CAresult$V6[char_index], CAresult$V7[char_index], CAresult$V8[char_index], CAresult$V9[char_index])
         malignancy <- CAresult$V10[char_index]
         
         # LEVEL
         levelkey <- paste0(substr(key, 1, regexpr("ROI", key)[1]-9), substr(key, regexpr("ROI", key)[1]+3, nchar(key)))
         level <- (levels[levels$filename == levelkey,4])
         
         # CENTERS
         center_index <- grep(levelkey, centers$V1)[1]
         x_center <- centers$V2[center_index]
         y_center <- centers$V3[center_index]
         z_center <- centers$V4[center_index]
         
         # PATIENT 
         patient = as.numeric(strsplit(key, "-")[[1]][3])
         
         # PATIENTLEVEL
         patientlevel = paste0(toString(patient), "-", toString(level))
         
         #NUM_SHs, SHs
         start <- grep("^Harmonic Map$", SHlines) + 1
         end <- length(SHlines)
         num_SHs <- end-start
         
         if (num_SHs < SH_max) {  #  have to pad with 0s
           SHs <- c(SHlines[start:(end-1)] , rep("0", (SH_max - num_SHs))) 
         } else {
           SHs <- SHlines[start:(start+SH_max-1)]
         } 
   
         # PUSH TO DF
            # key, patientlevel, patient, level, volume, chars, num_SHs, SHs, malignancy
         full_df[i,] <- c(key, x_center, y_center, z_center, patientlevel, patient, level, volume, chars, num_SHs, SHs, malignancy)

      } else { # end if (length(SHlines) > (SH_include + 10)) { 
      cat("previous to ", key, " Harmonic map did not process enough \n")
      failed = failed + 1 
      }
    } else { 
      cat("Harmonic map file not found \n")
    }
} # end for loop
#close("./training_file.csv")
save(full_df, file="full_df.Rda")
