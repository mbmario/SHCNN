# Regreader.R

curdir <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Results/RandomForest_Reg_V7/400SH__PrA"

files <- dir(curdir)
setwd(curdir)

n <- length(files)
diffv = rep(0, 5)
predv = rep(0, 5)

for (i in 1:length(files)){
  diffv <- diffv + (1/n)*(Regreader_fn(files[i], FALSE))
  predv <- predv + (1/n)*(Regreader_fn(files[i], TRUE))
}

basename(curdir)
predv
diffv