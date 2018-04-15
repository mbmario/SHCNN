# set a directory and inclusion parameters. Builds t1-t10 folders of test/train of set parameters, and 
# intended for StaticSets

### Dataset parameters
df <- o3pa
pr <- "o3pa"

no_Windows <- FALSE # TRUE overrides Small_Windows
  Small_Windows <- TRUE # if false, uses regular windows

SH_include <- 300
priority_a_bool <- TRUE # 
parent_dir <- "/media/mario/DiskB/LIDC_Data_Current/RFData/StaticSets"

### Data/script filepath parameters; only change when you reorganize data source dirs
Small_Windows_csv <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/SmallWindows/features_fc6.csv"
Small_Windows_names <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/SmallWindows/image_names.csv"

Full_Windows_csv <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/50mmWindows/features_fc6.csv"
Full_Windows_names <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/50mmWindows/image_names.csv"

priority_a_path <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_a_df"
priority_b_path <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_b_df"

appendCNNendPARENT <- "/home/mario/Documents/LIDC_Code_Current/PIPELINE/Compile_data/appendCNNendPARENT.py"  
###

# set ifs
windows <- ""
if (no_Windows) {
  windows <- ""
} else if (Small_Windows) {
  windows <- "SmallWindows"
} else { windows <- "FullWindows"
}


windows_names =""; windows_csv = ""
if (Small_Windows) {
  windows_names = Small_Windows_names 
  windows_csv = Small_Windows_csv  
} else {
  windows_names = Full_Windows_names
  windows_csv = Full_Windows_csv
}


# create name and mkdir setname, mkdirs t1-10
setwd(parent_dir)
set_name <- paste0(SH_include, "SH_", windows, "_", pr)
dir.create(paste0(parent_dir, "/", set_name))
for (i in 1:10) {
  trial_dir_name <- paste0(parent_dir, "/",set_name ,"/t", i)
  dir.create(trial_dir_name)
}


# select cols and shuffle rows
start_col <- 18 # SH1 (18); doesn't get used in 
end_col <- 18 + SH_include - 1 

# also numSHs (16) vol (8)
if (SH_include < 2) { # only CNN case
  cols <- c(1, ncol(df)) 
} else if (no_Windows) { # only SH case
  cols <- c(start_col:end_col, ncol(df))
} else { # both CNN and SH
  cols <- c(1,start_col:end_col, ncol(df)) # last is malig; add other indices to include here} 
}
# note that key (1) is necessary for appendCNNendPARENT
df <- df[,cols]
#df <- df[df$volume != 0,] # if zeroes not already filtered
df <- df[sample(nrow(df)),] # shuffle


# write to testing and training
rows <- nrow(df)
tenth <- floor(rows/10)
indices <- c(0, tenth*(1:10)+(rows - 10*tenth)) # 11 bounds for the 10 partitions

# write files
for (i in 1:10) {
  
  trial_dir_name <- paste0(parent_dir, "/",set_name ,"/t", i)
   
  test_indices <- (indices[i]+1):indices[i+1] # incrementing block of 10%
  train_indices <- setdiff((1:rows), test_indices) # all non_test indices
  
  test_df <- df[test_indices,]
  train_df <- df[train_indices,] 
    
  test_name = paste0(trial_dir_name , "/" , set_name , "_testing_pre.csv")
  train_name = paste0(trial_dir_name , "/" , set_name , "_training_pre.csv")
  
  if (no_Windows) { # change because we are not running script at the end
    test_name = paste0(trial_dir_name , "/" , set_name , "_testing_learnable.csv")
    train_name = paste0(trial_dir_name , "/" , set_name , "_training_learnable.csv")
  }
  
  write.table(test_df, test_name, quote=FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
  write.table(train_df, train_name, quote=FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
  
}

# run python script to append
# args [1] headdir, [2] image_names, [3] features_fc6
if (!no_Windows) { # if !no_Windows, then append
  command = ""
  if (SH_include == 0) {
    command <- paste(appendCNNendPARENT, paste0(parent_dir, "/",set_name), windows_names, windows_csv, 0)
  } else {
    command <- paste(appendCNNendPARENT, paste0(parent_dir, "/",set_name), windows_names, windows_csv, 1)
  }
    system(command)  
}#else # don't run script; files are already renamed







 