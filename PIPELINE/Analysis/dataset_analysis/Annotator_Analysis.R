# Annotator_Analysis.R

# looks at full_df by annotator, as seen through their naming conventions

# import data
load("/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/full_df_proc.Rda")
full_df <- full_df[full_df$patientlevel != "0",]

# reduce and classify 
sub_df <- full_df[,c(1,5, ncol(full_df))]
sub_df$namingstyle  <- rep("", nrow(sub_df))

for (i in 1:nrow(sub_df)){
  
  target <- sub_df$key[i]
  target<-substr(target, regexpr("annotator", target)[1] +12, nchar(target))

  
  # annotator "a"
  if (grepl("Nodule_", target)) {
    sub_df$namingstyle[i] <- "a"
  }
  
  # annotator "b"
  else if (grepl("IL{1}", target)) {
    sub_df$namingstyle[i] <- "b"  
  }
  
  # annotator "c"
  else if (grepl("MI{1}", target))  {
    sub_df$namingstyle[i] <- "c"     
  }
  
  # annotator "d"
  else if (!is.na(as.numeric(target))  ) { #ignore warnings pls
    sub_df$namingstyle[i] <- "d"     
  }
  
  # unknown 
  else {
    sub_df$namingstyle[i] <- "x"     
  }
  
}


# analysis
amalig <- as.numeric(sub_df$malignancy[sub_df$namingstyle == "a"])
bmalig <- as.numeric(sub_df$malignancy[sub_df$namingstyle == "b"])
cmalig <- as.numeric(sub_df$malignancy[sub_df$namingstyle == "c"])
dmalig <- as.numeric(sub_df$malignancy[sub_df$namingstyle == "d"])



