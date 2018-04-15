#!/usr/bin/python3

# parent script for the resample_bitmaps c++ executable 
# prepares the proper inputs

### Needed files: 

#  	0) c++ executable that does the resizing
resample_bitmaps = "/home/mario/Documents/LIDC_resample_bitmaps/resample_bitmaps/build/resample_bitmaps"

#	1) key_n_rad.csv [5874x3] : filename and radius in mm (from vol2mmwindow.R)
key_n_rad = "/home/mario/Documents/LIDC_resample_bitmaps/data/key_n_rad.csv"

# 	2) voxel_spacing.csv [5654x4]: pixel size in mm: x,y,z
voxel_spacing = "/home/mario/Documents/LIDC_resample_bitmaps/isoROIsp/spacings.csv"

# nodule names are different so conversion is required

# 	3) input dir CHANGE FOR RUN
inputdir = "/media/mario/DATAPART1/LIDC_resample/LIDC_bmp_combined"

# 	4) output dir CHANGE FOR RUN
outputdir = "/media/mario/DATAPART1/LIDC_resample/LIDC_bmp_croppedcombined"

### end files

import pdb
import os
from subprocess import call

def radfn(radline):
	radkey = radline.split(",")[1]
	radkey = radkey[radkey.find("IDRI-")+5:radkey.find("IDRI-")+10] + radkey[radkey.find("BINARY-ROI-")+11:-1]
	radkey = radkey.replace("-annotator-", "-")
	return radkey

def spfn(spline):
	spkey = spline[spline.find("LIDC_resampled_ROI/")+19:spline.find("-ROI.hdr")]
	return spkey

def bmpfn(filename):
	bmpkey = filename[0:filename.find("-ROI_")]
	return bmpkey


### make radfile into dictionary

radfile = open(key_n_rad, mode='r')
raddict = {}; spdict={}

while True: # go thru the radfile and add [key] = radius to dictionary

	radline = radfile.readline()
	if not radline: break # ends the file

	radkey = radfn(radline)
	radval = (float)(radline.split(",")[2][:-1]) * 10 # get rad in cm, convert to mm
	raddict[radkey] = radval #[0s keep getting overwritten]

radfile.close()


### go thru the spacings file and revise the dictionary entries

spfile = open(voxel_spacing, mode='r')

while True: 

	spline = spfile.readline()
	if not spline: break

	spkey = spfn(spline)
	spval = (float)(spline.split(",")[1])
	spdict[spkey] = spval
	
	
spfile.close()


### go thru input dir, process files, and write to outdir

input_files = os.listdir(inputdir)


for file in input_files:
	# resample_bitmaps usage: // [1] inputImage [2] outputImage [3] pxradx_arg [4] pxrady_ar
	
	bmp_key = bmpfn(file)

	
	# if we can't find both entries for bmp_key, print an error and skip the iteration
	if not ((bmp_key in raddict) & (bmp_key in spdict) ):
		pdb.set_trace()
		print("missing radius and/or spacing values corresponding to", bmp_key)
		continue

	#pdb.set_trace()

	pxrad = raddict[bmp_key] * spdict[bmp_key] * 3 # 4 is 2 (padding) x 2 (dim=2r)
	pxrad_str = (str)((int)(pxrad + 0.5))
	
	#command = resample_bitmaps + " " + inputdir + "/" + file + " " + outputdir + "/" + file + " " + pxrad + " " + pxrad # IO DOESNT WORK -- USE IMAGEMAGICK

	command = "convert " + inputdir + "/" + file + " -gravity Center -crop " + pxrad_str + "x" + pxrad_str + "+0+0 +repage " + outputdir + "/" + file

	call(command, shell=True)
