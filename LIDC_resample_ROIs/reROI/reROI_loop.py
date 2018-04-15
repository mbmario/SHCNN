#!/usr/bin/python3

# synchronizes the centers csv and the analyze directory
# loops the reROI over them and outputs to an ROI directory


from subprocess import call
from os import listdir
import sys
import csv
#import pdb

if (len(sys.argv) == 6):
	reROI = sys.argv[1]
	CSVFILE = sys.argv[2]
	INPUTANALYZE = sys.argv[3]
	OUTPUTANALYZE = sys.argv[4]
	OUTPUTTEXT = sys.argv[5]
else:
	print("Using default args for CSVFILE, input and output analyze dirs") 
	### DEFAULT PARAMS ###
	reROI='/home/mario/Documents/LIDC_resample_ROIs/reROI/build/reROI'
	CSVFILE='/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/centers.csv'
	#INPUTANALYZE='/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/in'
	#OUTPUTANALYZE='/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/out'
	INPUTANALYZE='/media/mario/DATAPART1/LIDC_Analyze_565'
	OUTPUTANALYZE='/media/mario/DATAPART1/LIDC_reROI'
	#OUTPUTTEXT='/home/mario/Documents/LIDC_resample_ROIs/reROI/testing/output.txt'
	OUTPUTTEXT='/home/mario/Documents/LIDC_resample_ROIs/reROI/output.txt'
	### end default params ###

# read the CSV
reader = csv.reader(open(CSVFILE), delimiter=',')

# read the analyze files in the directory arg as a list
anfiles = listdir(INPUTANALYZE)

#pdb.set_trace()

# set up the shell writer
with open(OUTPUTTEXT, 'w') as fout:
	call("echo 'errors in ROIS on run '$(date)", stdout=fout, shell=True)

for row in reader:
	# [0] patient number, [1] annotator, [2] nodule name
	# [3] x,  [4] y, [5] "z"

	#pdb.set_trace()

	anfile = "blank"
	for file in anfiles:
		if ( (file.find(row[0]) != -1) & (file.find(".hdr") != -1) ):
			anfile = file 
			continue
	
	if (anfile == "blank"):
		print ("no analyze file found for patient",  row[0])
		continue

	newfilename = "" + row[0] + "-" +  row[1] + "-" + row[2] + "-ROI"
	
	command = "" + reROI + " " + \
	INPUTANALYZE + "/" + anfile + " " + \
	OUTPUTANALYZE + "/" + newfilename + ".hdr" + " " + \
	row[3] + " " + row[4] + " " + row[5] 

	with open(OUTPUTTEXT, 'a') as fout:
		call(command, stdout=fout, shell=True)




# loop over list stuff in csv
#	 check to make sure the analyze file is there

