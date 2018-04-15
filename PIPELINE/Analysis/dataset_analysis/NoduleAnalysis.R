# NoduleAnalysis.R

# computes various analytics on the dataset

load("/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/full_df_proc.Rda")
outcsv <- "/media/mario/DiskB/LIDC_Data_Current/RFData/Results/Spreadsheets/NodInfo.csv"

full_df <- full_df[full_df$patientlevel != "0",]

#1. Average rating prediction variance (variance of [3 4 4] for nodule 1, etc), this will represent the robustness among different segmentations.


# loop over unique patientlevel, write to file
pls <- unique(full_df$patientlevel)
pls_len <- length(pls)
outdf <- data.frame(
  pl= rep("", pls_len),
  ct=rep(0,pls_len),
  mean=rep(0,pls_len),
  stddev=rep(0,pls_len),
  stringsAsFactors = FALSE
)

for (i in 1:pls_len) {
  
  subdf <- full_df[full_df$patientlevel == pls[i],c(1:21,418)]
  
  outdf$pl[i] <- pls[i]
  outdf$ct[i] <- nrow(subdf)
  outdf$mean[i] <- round(mean(as.numeric(subdf$malignancy)), 3)
  outdf$stddev[i] <- round(sd(as.numeric(subdf$malignancy)), 3)
  
}

write.table(outdf, file=outcsv, quote= FALSE, sep=",", row.names = FALSE)


#2. Average annotator rating variance (variance of [4 5 3] for nodule 1, etc), this will give us an idea of how different ratings can be given from different annotators. Also, we will know if off-by-one is reasonable (if different annotators' variance is greater than 1, then off-by-one can be considered a reasonable reference annotation) 

