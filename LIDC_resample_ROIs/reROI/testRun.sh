#!/bin/bash

# runs a single instance of 
IN="/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/in/0003_c.hdr"
OUT="/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/out/0003_c_ROI.hdr"
reROI="/home/mario/Documents/LIDC_resample_ROIs/reROI/build/reROI"

$reROI $IN $OUT 367.5 350 -191.5

# gdb usage : run "/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/in/0003_c.hdr" "/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/out/0003_c_ROI.hdr" 367.5 350 -191.5