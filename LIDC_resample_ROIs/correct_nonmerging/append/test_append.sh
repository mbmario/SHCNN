#!/bin/bash

append='/home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/append/build/append'
infile='/home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/append/testing/unit/0003-1-Nodule_001-ROI_fixed_x.bmp' # starts as 61 x 60

outfile='/home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/append/testing/unit/0003-1-Nodule_001-ROI_fixed_x_slice.bmp'

$append $infile $outfile

convert $infile $outfile +append $infile

# gdb: run /home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/testing/nonmerging_cases/0003-1-Nodule_001-ROI_fixed_x.bmp



