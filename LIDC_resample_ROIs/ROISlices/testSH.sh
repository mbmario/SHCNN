#!/bin/bash

EXE="/home/mario/Documents/LIDC_resample_ROIs/ROISlices/build/ROISlices"
INFILE="/home/mario/Documents/LIDC_resample_ROIs/ROISlices/testing/in/0002-1-Nodule_001-ROI.hdr"
OUTFILE="/home/mario/Documents/LIDC_resample_ROIs/ROISlices/testing/out/0002-1-Nodule_001-ROI.bmp"

$EXE $INFILE $OUTFILE 0

# gdb usage: run /home/mario/Documents/LIDC_resample_ROIs/ROISlices/testing/in/0002-1-Nodule_001-ROI.hdr /home/mario/Documents/LIDC_resample_ROIs/ROISlices/testing/out/0002-1-Nodule_001-ROI.bmp 1