
#LIDC_total_dir <- "/media/mario/DATAPART1/LIDC_total"
# contains priority stuff
testing_and_training_dir <- ("/home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split5")
# use for drafts
ML_input_dir <- "/home/mario/Documents/3DLIDC_project_local/ML_input/SH_only" # I don't believe this is used
# more final!

# CTRL-F num_SHs 

# Char_and_SH: priority a, b, c
TEST=0.1
setwd("/media/mario/DATAPART1/LIDC_total")

priority_a <- read.csv("priority_a_learnable400.csv", header=TRUE, stringsAsFactors = FALSE)
priority_b <- read.csv("priority_b_learnable400.csv", header=TRUE, stringsAsFactors = FALSE)
priority_c <- read.csv("priority_c_learnable400.csv", header=TRUE, stringsAsFactors = FALSE)

n <- ncol(priority_a)

# priority_a
priority_a <- priority_a[,c(1,10:n)] 
priority_a_idxv_list = split_fn(priority_a, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_a[priority_a_idxv_list[[1]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_a400_learnable_training.csv"), sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_a[priority_a_idxv_list[[2]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_a400_learnable_testing.csv"),  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)

# priority_b
priority_b <- priority_b[,c(1,10:n)] 
priority_b_idxv_list = split_fn(priority_b, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_b[priority_b_idxv_list[[1]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_b400_learnable_training.csv"), sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_b[priority_b_idxv_list[[2]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_b400_learnable_testing.csv"),  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)

# prority_c
priority_c <- priority_c[,c(1,10:n)] 
priority_c_idxv_list = split_fn(priority_c, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_c[priority_c_idxv_list[[1]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_c400_learnable_training.csv"), sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_c[priority_c_idxv_list[[2]],], paste0(testing_and_training_dir, "/SH_and_sizes_priority_c400_learnable_testing.csv"),  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)