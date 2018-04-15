#!/bin/bash

INSLICE='/home/mario/Documents/LIDC_resample_ROIs/an2bmp/testing/in/0002-1-Nodule_001-ROI_fixed_x.hdr'
OUTSLICE='/home/mario/Documents/LIDC_resample_ROIs/an2bmp/testing/out/0002-1-Nodule_001-ROI_fixed_x.bmp'
an2bmp='/home/mario/Documents/LIDC_resample_ROIs/an2bmp/build/an2bmp'

$an2bmp $INSLICE $OUTSLICE

# gdb # run /home/mario/Documents/LIDC_resample_ROIs/an2bmp/testing/in/0002-1-Nodule_001-ROI_fixed_x.hdr /home/mario/Documents/LIDC_resample_ROIs/an2bmp/testing/out/0002-1-Nodule_001-ROI_fixed_x.bmp