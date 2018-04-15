#!/usr/bin/python3

# goes through the directory of slices and appends them using "append" if their sizes are nonsquare

from os import listdir, remove
from shutil import copyfile
from subprocess import check_output, call 

import pdb

# VARS (needs / at end of dirs)
SLICESDIR="/media/mario/DATAPART1/LIDC_slices_mystery/"
#SLICESDIR="/home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/master2testing/" # TESTING DIR
TEMPDIR="/media/mario/DATAPART1/LIDC_bmp_temp/" # for everybody's convenience
APPENDEXE="/home/mario/Documents/LIDC_resample_ROIs/correct_nonmerging/append/build/append"

slices = listdir(SLICESDIR)

for slice in slices:
	command = "identify " + SLICESDIR + slice # run identify command on all files
	out = check_output(command, shell=True)# finally works
	out = out.decode("utf-8") # this is NOW string!!

	chop = out[out.find(" BMP "):]
	idx = chop.find("x") # the first x after bmp; that is, btw x and y
	x = int(chop[4:idx])
	y =  int(chop[idx+1:idx+3])

	if (x == y ): # if they are the same size, they're already good!
		continue

	#pdb.set_trace()

	# else: they are different sizes. Append in temp and move back
	
	origslicefile = SLICESDIR + slice
	tempslicefile = TEMPDIR + slice
	barfile = TEMPDIR + slice + "_bar.bmp"
	
	copyfile(origslicefile, tempslicefile) # move to temp for convenience

	command = APPENDEXE + " " + tempslicefile + " " + barfile 
	call(command, shell=True) # creates the bar in the temp

	#pdb.set_trace()
	
	# following block: concatenate the bar on to the appropriate dimension, and save over the original file
	if (x > y): # use -append: 2nd image goes on bottom
		command = "convert " + tempslicefile + " " + barfile + " -append " + origslicefile #TEMPDIR + slice 
	else: # use +append: 2nd image goes on right
		command = "convert " + tempslicefile + " " + barfile + " +append " +  origslicefile # TEMPDIR + slice
	call(command, shell=True) 

	remove(barfile)
	remove(tempslicefile)
	

# end for 
