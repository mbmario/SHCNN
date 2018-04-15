# paramter_graph_frequencies.R

curdir <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Results/RandomForest_V7/Run1/400SH_SmallWindows_PrA"
outdir <- "~/Desktop/"


files <- dir(curdir)
setwd(curdir)

n <- length(files)

obo_accuracy = rep(0, 7)
tru_accuracy = rep(0, 7)
total = rep(0, 7)

for (i in 1:n) {

    #print(i)
    results <- read_CM_frequencies(files[i])
    
    obo_accuracy <- (1/n)*results[[1]] + obo_accuracy
    tru_accuracy <- (1/n)*results[[2]] + tru_accuracy
    total <- (1/n)*results[[3]] + total
    
}

obo_accuracy <- round(obo_accuracy,3)
tru_accuracy <- round(tru_accuracy, 3)
total <- round(total, 1)

write.table(rbind(obo_accuracy, tru_accuracy, total), paste0(outdir, basename(curdir), ".csv"), quote=FALSE, sep =",", row.names = TRUE, col.names = FALSE)
