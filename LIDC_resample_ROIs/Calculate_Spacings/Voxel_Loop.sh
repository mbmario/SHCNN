#!/bin/bash

# Loops over analyze files in a directory, and directs the output to a csv

INDIR="$1" 
OUTFILE="$2"

VSPATH="/home/mario/Documents/LIDC_resample_ROIs/voxel_spacing"

if [ $# -ne 3 ]; then
		INDIR="/media/mario/DATAPART1/LIDC_ROI_only/ALL_ROIS"
		OUTFILE="/home/mario/Documents/LIDC_resample_ROIs/Outfiles/voxel_spacing.csv"
		echo "using default indir $INDIR and writing to $OUTFILE "
		echo "all files in $INDIR should be analyze or otherwise ITK-readable"
fi

echo "filename, x_spacing, y_spacing, z_spacing" > $OUTFILE  


for file in $INDIR/*hdr
do
	fn=$(basename $file)
	echo $fn
	$VSPATH $file >> $OUTFILE
done
