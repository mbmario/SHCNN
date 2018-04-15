
LIDC_total_dir <- "/media/mario/DATAPART1/LIDC_total"
# contains priority stuff
testing_and_training_dir <- paste0(LIDC_total_dir, "/testing_and_training_drafts")
# use for drafts
ML_input_dir <- "/home/mario/Documents/3DLIDC_project_local/ML_input/Char_only"
# more final!

# Char_and_SH: priority a, b, c, d

setwd(LIDC_total_dir)

priority_c <- read.csv("priority_c_learnable.csv", header=TRUE, stringsAsFactors = FALSE)

# Char_only: separate chars 
priority_c <- priority_c[,c(2:9,61)] 

priority_c_idxv_list = split_fn(priority_c, TEST) # [[1]]: training index vector; [[2]]: testing index vector
write.table(priority_c[priority_c_idxv_list[[1]],], paste0(testing_and_training_dir, "/char_only_priority_c_learnable_training.csv"), sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)

write.table(priority_c[priority_c_idxv_list[[2]],], paste0(testing_and_training_dir, "/char_only_priority_c_learnable_testing.csv"),  sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
