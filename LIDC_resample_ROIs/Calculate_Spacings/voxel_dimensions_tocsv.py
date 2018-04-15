#!/usr/bin/python3

# parent for xml_dimensions_fn.py
# takes a directory and loops over all xmls
# writes their voxel dimension ranges to a csv

# ignores cases with <locus> or single-xyz point arrays

from os import listdir
import sys
import csv
#import pdb

FNS_PATH=('/home/mario/Documents/LIDC_resample_ROIs/Calculate_Spacings/fns')
sys.path.append(FNS_PATH)
import xml_dimensions_fn 

if (len(sys.argv) == 3):
	path = sys.argv[1]
	outfile = sys.argv[2]
else:
	print("Using default path and ~/Documents/voxel_dimensions.csv. optional: path as arg1, output as arg2")
	path="/media/mario/DATAPART1/LIDC_xml"
	outfile="/home/mario/Documents/voxel_dimensions.csv"

# set the writer
outwriter = csv.writer(open(outfile, 'w', newline=''))

files = listdir(path)

for file in files:

	if (file.find(".xml") == -1): # if some weird files sneak in, skip them
		continue 

	#pdb.set_trace()
	print(file)
	result_list = xml_dimensions_fn.xml_dimensions_fn((path  + "/" + file), False) 
	for tup in result_list:
		outwriter.writerow(tup)

#pdb.set_trace()
