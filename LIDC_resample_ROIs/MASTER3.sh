#!/bin/bash

Combine_bmp="/home/mario/Documents/LIDC_resample_ROIs/Combine_bmp/combine_bmp.py"
bmp_combined_dir="/media/mario/DATAPART1/LIDC_bmp_combined"
bmp_slices_dir="/media/mario/DATAPART1/LIDC_bmp_slices"
combine_error="/home/mario/Documents/LIDC_resample_ROIs/combine_error.txt"

$Combine_bmp $bmp_slices_dir $bmp_combined_dir $combine_error
