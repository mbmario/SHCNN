# testing_training.R
# (split into priorities) + (mingchen's stuff) -> testing and training

TEST = 0.1

LIDC_total_dir <- "/media/mario/DATAPART1/LIDC_total"
   # contains priority stuff
testing_and_training_dir <- paste0(LIDC_total_dir, "/testing_and_training")
   # use for drafts
ML_input_dir <- "/home/mario/Documents/3DLIDC_project_local/ML_input/Char_and_SH"
   # more final!

# Char_and_SH: priority a, b, c, d

setwd(LIDC_total_dir)

priority_a <- read.csv("priority_a_learnable.csv", header=TRUE, stringsAsFactors = FALSE)

priority_a_idxv_list = split_fn(priority_a, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_a[priority_a_idxv_list[[1]],], "priority_a_learnable_training.csv", sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_a[priority_a_idxv_list[[2]],], "priority_a_learnable_testing.csv",  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)


priority_b <- read.csv("priority_b_learnable.csv", header=TRUE, stringsAsFactors = FALSE)

priority_b_idxv_list = split_fn(priority_b, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_b[priority_b_idxv_list[[1]],], "priority_b_learnable_training.csv", sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_b[priority_b_idxv_list[[2]],], "priority_b_learnable_testing.csv",  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)


priority_c <- read.csv("priority_c_learnable.csv", header=TRUE, stringsAsFactors = FALSE)

priority_c_idxv_list = split_fn(priority_c, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_c[priority_c_idxv_list[[1]],], "priority_c_learnable_training.csv", sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_c[priority_c_idxv_list[[2]],], "priority_c_learnable_testing.csv",  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)


priority_d <- read.csv("priority_d_learnable.csv", header=TRUE, stringsAsFactors = FALSE)

priority_d_idxv_list = split_fn(priority_d, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_d[priority_d_idxv_list[[1]],], "priority_d_learnable_training.csv", sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
write.table(priority_d[priority_d_idxv_list[[2]],], "priority_d_learnable_testing.csv",  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)

