#!/bin/bash

# script that takes analyze and center files and turns them into RGB bitmap 

# in the LIDC_resample_ROIs director we have 
# Calculate_Centerpoints: 
# 	-.py: reads the xmls and makes a csv of their centerpoints
#	-DON'T NEED HERE

# Calculate_Spacings: DON'T NEED ANY OF THIS
# 	-voxel_spacing / Voxel_Loop: outputs the voxel spacings to stdout
# 	-combine_voxel_dim_spacing.R: writes result of nod info, spacings (mm)
# 	-combine_xmls: searches through the dicomdir and moves xml files to selected dir
# 	-voxel_dimensions_to_csv.py: runs a function that calculates ranges from xmls
# 	/Outfiles/
# 		-result.csv: nod info and ROI range in mm
# 		-voxel_spacing.csv: filenames and size of each pixel (i.e. spacings)
#		-voxel_dimensions.csv: nod info and size in voxels (y in ~mm whatever)	

# Combine_bmp
# 	-combine_bmp.py: runs a converter to merge dir of _fixed_{x,y,z} to a single file 
# 		NEED AT END
# 		args: {dir of _fixed x,y,z} {dir where you want combined images} {error log text file}

# d2a
# 	build of dimcom2analyze

# reROI NEED
# 	reROI_loop.py: chops into ROIs based on a 50mm window. 	
# 	{path to exe in build} {path to csv of centers} {dir of full analyze} {ROI output dir} {error log text file}

# ROISlices NEED
# 	converts dim of ROI to bitmap
# 	 {path to infile} {path to outfile } {dim: 0,1,or 2}

# ResampleIsotropic NEED
# 	resamples the ROIs
# 	{inputfile} {outputfile}

# so do analyze_dir --[reROI]--> ROI_dir --[ResampleIsotropic]--> resampled_ROI_dir --[ ROISlices x 3 ] --> bmp_slices_dir --[Combine_bmp]-->combined_bmps_dir 

analyze_dir="/media/mario/DATAPART1/LIDC_Analyze"
ROI_dir="/media/mario/DATAPART1/LIDC_ROI"
resampled_ROI_dir="/media/mario/DATAPART1/LIDC_resampled_ROI"
bmp_slices_dir="/media/mario/DATAPART1/LIDC_bmp_slices"
#bmp_combined_dir="/media/mario/DATAPART1/LIDC_bmp_combined" # -> m3
csvfile="/home/mario/Documents/LIDC_resample_ROIs/common_output/centers.csv"
reROI_error="/home/mario/Documents/LIDC_resample_ROIs/reROIerror.txt"
# combine_error="/home/mario/Documents/LIDC_resample_ROIs/combine_error.txt" -> m3

reROI_loop="/home/mario/Documents/LIDC_resample_ROIs/reROI/reROI_loop.py"
reROI_exe="/home/mario/Documents/LIDC_resample_ROIs/reROI/build/reROI"
ResampleIsotropic="/home/mario/Documents/LIDC_resample_ROIs/ResampleIsotropic/build/ResampleIsotropic"
ROISlices="/home/mario/Documents/LIDC_resample_ROIs/ROISlices/build/ROISlices"
#Combine_bmp="/home/mario/Documents/LIDC_resample_ROIs/Combine_bmp/combine_bmp.py" -> m3

# analyze to ROI
#$reROI_loop $reROI_exe $csvfile $analyze_dir $ROI_dir $reROI_error

for f in $ROI_dir/*hdr
do 
	resampled_ROI_dir_name="$resampled_ROI_dir"/"$(basename $f)"
	echo  "resample isotropic in:"; echo "$f"; echo "resample isotropic out"; 	echo "$resampled_ROI_dir_name"
#	$ResampleIsotropic $f "$resampled_ROI_dir_name"

	bmp_slices_dir_name="$bmp_slices_dir"/"$(basename $f)"
	bmp_slices_dir_name="${bmp_slices_dir_name::-4}".bmp 
	echo "ROISlices in: "; echo "$resampled_ROI_dir_name"; echo "ROISlicesout"; echo "$bmp_slices_dir_name"
	$ROISlices $resampled_ROI_dir_name $bmp_slices_dir_name 0
	$ROISlices $resampled_ROI_dir_name $bmp_slices_dir_name 1
	$ROISlices $resampled_ROI_dir_name $bmp_slices_dir_name 2
done

# $Combine_bmp $bmp_slices_dir $bmp_combined_dir $combine_error #moved to master3


