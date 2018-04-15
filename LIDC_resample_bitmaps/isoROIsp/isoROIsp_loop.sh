#!/bin/bash

INPUTFILES="/media/mario/DATAPART1/LIDC_resample/LIDC_resampled_ROI"
EXE="/home/mario/Documents/LIDC_resample_bitmaps/isoROIsp/build/isoROIsp"
SPACINGSDOC="/home/mario/Documents/LIDC_resample_bitmaps/isoROIsp/spacings.csv"

for file in "$INPUTFILES"/*hdr; do
	"$EXE" "$file" >> "$SPACINGSDOC"
done

