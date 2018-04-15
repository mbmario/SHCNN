#!/usr/bin/python3

# loop_dir -> read_nod -> read_xml (this is loop_dir)

from os import listdir
import sys
import csv
#import pdb

import read_xml


if (len(sys.argv) == 3):
	path = sys.argv[1]
	outfile = sys.argv[2]
else:
	path="/media/mario/DATAPART1/LIDC_xml"
	outfile="/home/mario/Documents/LIDC_resample_ROIs/Calculate_Centerpoints/output/centers.csv"
	print("Using", path, "and", outfile, ". optional: path as arg1, output as arg2")


outwriter = csv.writer(open(outfile, 'w', newline=''))

files = listdir(path)

for file in files:

	if (file.find(".xml") == -1): # if some weird files sneak in, skip them
		continue 

	#pdb.set_trace()
	#print((path  + "/" + file))
	centers_list = read_xml.read_xml((path  + "/" + file)) 
	
	for tup in centers_list: 
		outwriter.writerow(tup)