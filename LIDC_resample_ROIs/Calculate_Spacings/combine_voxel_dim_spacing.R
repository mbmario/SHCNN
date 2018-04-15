#!/usr/bin/Rscript

CD="/home/mario/Documents/LIDC_resample_ROIs/Outfiles"

# combines outfiles from 
# 	voxel_dimensions_tocsv.py -> csv: patient_no, nodule_name*, x_range, y_range, z_range
# *(" " -> "_")
# 	voxel_spacing_tocsv.py 	  -> csv: patient_no, x_spacing, y_spacing, z_spacing

setwd(CD)

dims <- read.table("./voxel_dimensions.csv", header=FALSE, sep=",", col.names=c("patn", "nodn", "xrange", "yrange", "zrange"), stringsAsFactors = FALSE)
dims$patn <- as.numeric(dims$patn)

# filename, x_spacing, y_spacing, z_spacing
spacings <- read.table("./voxel_spacing.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)


# add a numerical column to spacings so that it can be matched to dims
filename_to_patn <- function(filename) { # str filename -> int patient number
   result <- substr(filename, regexpr("LIDC-IDRI", filename)[1] + 10, regexpr("LIDC-IDRI", filename)[1] + 13)
   return (as.numeric(result))
}
spacings$patn <- filename_to_patn(spacings$filename)

# delete duplicated patient numbers in spacing; there should be no NAs
spacings <- spacings[!duplicated(spacings$patn),]

# join the two dataframes, then convert to mm
merged <- merge(spacings, dims)

merged$x_mm <- merged$x_spacing * merged$xrange
merged$y_mm <- merged$y_spacing * merged$yrange
merged$z_mm <- merged$z_spacing * merged$zrange

result <- merged[,c(1,6,10:12)]

maxes <- c(max(result$x_mm), max(result$y_mm), max(result$z_mm))
sizes <- c(result$x_mm, result$y_mm, result$z_mm)

write.table(result,"result.csv", quote = FALSE, col.names=c("Patient_number", "Nodule_name", "x_range_in_mm", "y_range_in_mm", "z_range_in_mm"))

# # are there any conflicts?yes
# conflicts <- (duplicated(paste0(merged$patn, as.character(merged$nodn), sep="__")))
# num_conflicts <- sum(conflicts)
# merged_conflicts <- merged[conflicts,]
# merged_conflicts$conf_code <- paste0(merged_conflicts$patn, as.character(merged_conflicts$nodn), sep="__")