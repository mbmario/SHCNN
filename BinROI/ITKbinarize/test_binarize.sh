#!/bin/bash

exe="/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/build/binarize"
testin_an="/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003_c.hdr"
testin_csv="/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003-1-Nodule_001"
testout="/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003-1-Nodule_001_SEGG.hdr"

testin_an="/media/mario/DATAPART1/LIDC_Analyze/LIDC_Analyze/0291_a.hdr"
testin_csv="/media/mario/DATAPART1/BinROI_data/seg_csvs/0291_segmentations/0291-1-IL057_157551"
testout="/media/mario/DATAPART1/BinROI_data/BINARY-ROIs//0291-1-IL057_157551.hdr"
$exe $testin_an $testin_csv $testout

# gdb: 
# run /home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003_c.hdr /home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003-1-Nodule_001 /home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/testing/0003-1-Nodule_001_SEGG.hdr

#/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/build/binarize /media/mario/DATAPART1/LIDC_Analyze/LIDC_Analyze/0291_a.hdr /media/mario/DATAPART1/BinROI_data/seg_csvs/0291_segmentations/0291-1-IL057_157551 /media/mario/DATAPART1/BinROI_data/BINARY-ROIs//0291-1-IL057_157551.hdr
