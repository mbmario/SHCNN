#!/bin/bash

# loops over dir INDIR of dicomdir and writes the analyze to OUTDIR of analyze

### PARAMS ###
INDIR='/media/mario/DATAPART1/LIDC_dicom_org_566'
OUTDIR='/media/mario/DATAPART1/LIDC_Analyze_566/'
D2A='/home/mario/Documents/LIDC_resample_ROIs/d2a/build/DicomToAnalyze'
### PARAMS ###

for f in ${INDIR}/*; do
	outname=$(basename $f)
	echo $outname	
	$D2A $f $OUTDIR$outname$'.hdr'
done
