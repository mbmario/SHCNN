# mistakes_spreadsheet.R
# run on Windows so you can inspect the failures with Matlab code or 

# DIRECTORIES

rejectedMC <- 'E:/3DLIDC_project_E/LIDC_subset_known_diagnosis/error_or_stuck/LIDC_subset_known_diagnosis_error'
  # didn't get processed by annotations_Mingchen
crashedMC <- 'E:/3DLIDC_project_E/LIDC_subset_known_diagnosis/error_or_stuck/LIDC_subset_known_badbadbad'
  # crashed annotations_Mingchen and OS
nonSH <-  'E:/3DLIDC_project_E/LIDC_subset_known_diagnosis/processed_SHs'
  # SHs didn't process
crashedGU <- 'E:/3DLIDC_project_E/LIDC_subset_known_diagnosis/error_or_stuck'
  # _specialMesh.m: Gu's program got stuck on them


# REJECTED BY LIDC_MC
setwd(rejectedMC) 
file_names <- list.dirs(path=".", recursive= FALSE)
file_names <- file_names[(file_names != "./reslice") & (file_names != "./offs")] #filter other dirs
step <- rep("1: LIDC_annotations_mingchen.m", length(file_names))
reason <- rep("Rejected by LIDC_annotations_mingchen.m", length(file_names))

setwd(crashedMC)
files <- list.dirs(path=".", recursive= FALSE)
file_names <-  c(file_names, files)
step <- c(step, rep("1: LIDC_annotations_mingchen.m", length(files)))
reason <- c(reason, rep("Crashed LIDC_annotations_mingchen.m", length(files)))

setwd(crashedGU)
files <- list.files(path=".", pattern="_specialMesh.m")
file_names <-  c(file_names, files)
step <- c(step, rep("2: main.m (Gu .exe part)", length(files)))
reason <- c(reason, rep("Timed out Gu HarmonicMapper.exe", length(files)))
          

# THIS WILL CHANGE WHEN I RE-RUN IT
setwd(nonSH)
files <- list.files(path=".")#, pattern=""
files <- files[file.info(files)$size==533]
file_names <-  c(file_names, files)
step <- c(step, rep("2: main.m (Gu .exe part)", length(files)))
reason <- c(reason, rep("Empty output from Gu HarmonicMapper.exe", length(files)))

files <- list.files(path=".")#, pattern=""
files <- files[(file.info(files)$size>533) & (file.info(files)$size<1050)]
file_names <-  c(file_names, files)
step <- c(step, rep("3: complete", length(files)))      
reason <- c(reason, rep("<= about 50 SHs", length(files)))

spreadsheet <- data.frame(file_names, step, reason)
write.csv(spreadsheet, "errors.csv")

setwd('E:/3DLIDC_project_E/LIDC_subset_known_diagnosis/')
