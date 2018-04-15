# repX_Ytimes_desc_Compiler
# 
### Dataset parameters

# don't change these three
Small_Windows <- TRUE # 
priority_a_bool <- TRUE # 
parent_dir <- "/media/mario/DiskB/LIDC_Data_Current/RFData/StaticSets/SH_Rep"


# changeable
# for counting backwards

maxSH <- 63
times <- 2

# useful: 
#totalx <- sum(seq(from=maxSH, to=1, by=-1))*times # good to have this be ~ 4000
sum(seq(from=maxSH, to=1, by=-1))*times # good to have this be ~ 4000
 
### Data/script filepath parameters; only change when you reorganize data source dirs
windows_csv <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/SmallWindows/features_fc6.csv"
windows_names <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/SmallWindows/image_names.csv"

#Full_Windows_csv <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/50mmWindows/features_fc6.csv"
#Full_Windows_names <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Raw_Data/50mmWindows/image_names.csv"

priority_a_path <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_a_df"
#priority_b_path <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_b_df"

appendCNNendPARENT <- "/home/mario/Documents/LIDC_Code_Current/PIPELINE/Compile_data/appendCNNendPARENT.py"  
###

# MODIFIED set ifs
windows <- "SmallWindows"

# create setname
set_name <- paste0("rep", maxSH, "_", times,"times_desc" )

# create name and mkdir setname, mkdirs t1-10
setwd(parent_dir)
dir.create(paste0(parent_dir, "/", set_name))
for (i in 1:10) {
  trial_dir_name <- paste0(parent_dir, "/",set_name ,"/t", i)
  dir.create(trial_dir_name)
}

# set df
load(priority_a_path)
df <- priority_a

# set SH rep vec
SH_rep_vec <- rep(0,maxSH * times)
for (i in 1:maxSH) {
  SH_rep_vec[i] <- (maxSH - i + 1 ) * times
}

# reconcile cols and SH_rep_vec
SH_include <- length(SH_rep_vec)
start_col <- 18 # SH1 (18); doesn't get used in 
end_col <- 18 + SH_include - 1 

cols <- c()
for (i in 1:SH_include) {
  df_idx <- start_col + i - 1 # index of the ith SH coeff
  cols <- c(cols, rep(df_idx, SH_rep_vec[i])) # rep that however many times
}
cols <- c(1, cols, ncol(df)) # bookend with key and malignancy

# select and shuffle rows
df <- df[,cols] # note that key (1) is necessary for appendCNNendPARENT
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
  
  write.table(test_df, test_name, quote=FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
  write.table(train_df, train_name, quote=FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
  
}

# run python script to append
# args [1] headdir, [2] image_names, [3] features_fc6, [4] I forget
command <- paste(appendCNNendPARENT, paste0(parent_dir, "/",set_name), windows_names, windows_csv, 1)
system(command)  








 