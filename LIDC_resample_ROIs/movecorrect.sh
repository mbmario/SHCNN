#!/bin/bash
 
INDIR='/media/mario/DATAPART1/LIDC_combined_dir_linear'
OUTDIR='/media/mario/F74F-9A3F/'

cd "$INDIR" 
for f in "$INDIR"/*linear.bmp
do 
	cp "$f" "$OUTDIR"
done  