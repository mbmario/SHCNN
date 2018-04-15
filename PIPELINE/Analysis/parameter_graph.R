# parameter_graph.R
# DOESN'T ACTUALLY DO THAT

#setwd("/home/mario/Documents/3D_LIDC_round2/Analysis")



dir1 <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Results/RandomForest_V7/repctvol/200SH_SmallWindows_o3pa"


curdir <- dir1
trainline <- 10; spaceidx <- 3

files <- dir(curdir)
setwd(curdir)

n <- length(files)
tru_accuracy = rep(0, n)
obo_accuracy = rep(0, n)
train_error = rep(0, n)

acm <- matrix(0,7,7)


for (i in 1:length(files)) {
  print(i)
  obo_accuracy[i] = read_CM_fn(files[i], TRUE)
  tru_accuracy[i] = read_CM_fn(files[i], FALSE)
  
  #true_truth_freq = read_CM_more_fn(files[i], FALSE, FALSE, TRUE)
  #acm <- acm + read_CM_more_fn(files[i], TRUE) # truth is rows, predictions is cols
  
  #line <- read.table(files[i], skip = trainline - 1, nrow=1)
  #train_error[i] = as.numeric(line[4]) #as.numeric(substr(line,gregexpr(" ",line)[[1]][3] + 1, nchar(line)))
}
# 
# colnames(acm) <- c("pred 0", "pred 1", "pred 2", "pred 3", "pred 4", "pred 5", "pred 6")
# rownames(acm) <- c( "truth 0", "truth 1", "truth 2", "truth 3", "truth 4", "truth 5", "truth 6")
# CMfile = paste0("/media/mario/DiskB/LIDC_Data_Current/RFData/Results/Spreadsheets/ConfusionMats/", basename(dir1), ".csv")
# write.table(" ,", CMfile, append=FALSE, quote=FALSE, sep = ",", row.names = FALSE, col.names = FALSE, eol= "")
# write.table(acm, CMfile, append=TRUE, quote=FALSE, sep = ",")

files[1]
mean(obo_accuracy[1:10])
mean(tru_accuracy[1:10])

sd(obo_accuracy[1:10])
sd(tru_accuracy[1:10])
mean(train_error[1:10])

