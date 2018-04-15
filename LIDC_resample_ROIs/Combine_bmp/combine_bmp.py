#!/usr/bin/python3

# uses imagemagick to merge 3 bmps into a rgb bmp
# http://www.imagemagick.org/Usage/color_basics/ # Combining RGB Channel Images

# usage example: /testing/in
# convert 0002-1-Nodule_001-ROI_fixed_x.bmp 0002-1-Nodule_001-ROI_fixed_y.bmp 0002-1-Nodule_001-ROI_fixed_z.bmp -set colorspace RGB -combine -set colorspace sRGB 0002-1-Nodule_001-ROI_combined.bmp

import os
import sys
from subprocess import call
import pdb

if (len(sys.argv) == 4):
	parent_in_dir = sys.argv[1]
	out_dir = sys.argv[2]
	error_log = sys.argv[3]
else:	
	print("Using default directories (optional: set 2 args and parent_dir, out_dir")
	parent_in_dir = "/home/mario/Documents/LIDC_resample_ROIs/Combine_bmp/testing/in"
	out_dir = "/home/mario/Documents/LIDC_resample_ROIs/Combine_bmp/testing/out"
	error_log = "/home/mario/Documents/LIDC_resample_ROIs/Combine_bmp/error_log.txt"

# list files in the indirectory

xfile = ""
yfile = ""
zfile = ""

infiles = os.listdir(parent_in_dir) # list of all files in parent_in_dir
infiles = sorted(infiles) # to guarantee order

idx = 0

os.chdir(parent_in_dir)

while (idx < len(infiles)):

	#pdb.set_trace()

	#print(infiles)

	if (infiles[idx].find("_fixed_x") == -1): # skip this: not an x
		print("looking for x: skipping", infiles[idx])
		idx = idx + 1
		continue
	# end if
	
	if ((infiles[idx+1].find("_fixed_y") != -1 ) & (infiles[idx+2].find("_fixed_z") != -1)): 
	# correct case: there is an x, y, and z. Fire the cannons
		
		# form the command! 
		xfile = infiles[idx]
		yfile = infiles[idx+1]
		zfile = infiles[idx+2]

		firstpart = xfile[:xfile.find("_fixed_x")]
		outname = firstpart + "_combined_rgb_s.bmp"  
		outname_lin = firstpart + "_combined_rgb_linear.bmp"  

		command = "convert " + xfile + " " + yfile + " " + zfile + " " + "-set colorspace RGB -combine -set colorspace sRGB " + out_dir + "/" +outname 
		command2 = "convert " + xfile + " " + yfile + " " + zfile + " " + "-set colorspace RGB -combine -set colorspace RGB " + out_dir + "/" +outname_lin 

		#pdb.set_trace()
		with open(error_log, 'w') as fout:
			#call(command, stdout=fout, shell=True) # sRGB
			call(command2, stdout=fout, shell=True) # LINEAR (use!)

		idx = idx + 3
		
	else: # skip this x: no y and z found 
		print("no y and z found for ", infiles[idx], "skipping" )
		idx = idx + 1

	#end else	

# end loop	

command = "convert "