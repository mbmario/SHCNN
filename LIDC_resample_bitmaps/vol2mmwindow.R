#!/usr/bin/Rscript

fullldfloc <- "/home/mario/Documents/LIDC_resample_bitmaps/data/full_df_proc.Rda"
outname <- "/home/mario/Documents/LIDC_resample_bitmaps/data/key_n_rad.csv"
load(fullldfloc)

smalldf <- full_df[,c(1,8)]

v2r <- function(vol) { return ( ((3*as.numeric(vol))/(4*pi))^(1/3)) } 

smalldf$rad <- unname(sapply(smalldf$volume, v2r))
write.table(smalldf[,c(1,3)], file=outname, quote=TRUE, sep=",", col.names=FALSE)