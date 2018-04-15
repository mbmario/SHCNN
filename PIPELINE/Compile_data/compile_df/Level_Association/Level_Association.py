#!/usr/bin/python3

# Level_Association.R 
# given a csv of nodule centers, outputs a csv with nodules and their association.

# argv[1]: full filepath
# argv[2]: Sensitivity: Maxiumum Euclidean distance at which point they are considered same nodule
	# on nods 3,4,5,11, range was 0-3.23, min nonmatch was 9

#import pdb	
import sys
import string
from Level_Association_fn import printlist

import pdb

 #bash: sed 's/Nodule\ 0/Nodule_0/' <centers.csv >centers_nospaces.csv

# default values
path = "/home/mario/Documents/3DLIDC_project_local/programs_linux/level_test"
sensitive = 5 # actually a good value

if (2 <= len(sys.argv)  <= 3): 
	path = sys.argv[1] 
	if (len(sys.argv) == 3):
		sensitive = sys.argv[2]

# check args
#	print("looking for path", path, "; applying sensitivity", sensitive)

# read file
infile = open(path)
lines = infile.readlines()


# set outfile

list_patient = []
old_patient = ""
level = 1
print("filename,  distance,  patient,  level") # csv header

for line in lines:

	lineparts = line.split(" ") # [0] filename, [1] x, [2] y, [3] z
	
	if (len(lineparts) != 5):
		print("line has wrong number of strings (should be 4):")  
		print(lineparts)
		break

	filename = lineparts[0]

	fileparts = filename.split("-")

	patient = fileparts[2]
	annotator = fileparts[4]

	#pdb.set_trace()

	if ((old_patient != patient)): # this is a NEW patient
		printlist(list_patient, level, sensitive) # process the OLD patient
	 	
		level = 1 # reset patient-specific values
		list_patient = []
		old_patient = patient
	# end if

	entry = (patient, annotator, lineparts[1], lineparts[2], lineparts[3], filename)
	list_patient.append(entry)
		# 	if  printlist has already processed, this is the first element
		#	if  printlist has not processed, this is added

	if (line == lines[-1]): # EOF case
		printlist(list_patient, level, sensitive)
	# end if 

# end for loop

infile.close()