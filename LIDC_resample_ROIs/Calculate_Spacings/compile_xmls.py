#!/usr/bin/python3

# moves xml for each patient to a new directory for further scripts
# for each xml in the parent directory path

# 	test if cxt -> break
# 	(ct case) save with patient directory as prefix in out_dir

import os
import re
import sys
from shutil import copyfile

print(len(sys.argv))

if (len(sys.argv) == 3):
	parent_in_dir = sys.argv[1]
	out_dir = sys.argv[2]
else:	
	print("Using default directories (optional: set 2 args and parent_dir, out_dir")
	parent_in_dir="/media/mario/DATAPART1/LIDC_original"
	out_dir="/media/mario/DATAPART1/LIDC_xml"

print("looking for xmls in tree of \n", parent_in_dir, "\n", "and copying to \n", out_dir)

for (root, subdirs, files) in os.walk(parent_in_dir):
	# "root" is a string, "files" is a list 
	
	# find the xmls
	pattern = "xml"
	indices = [i for i, x in enumerate(files) if re.search(pattern, x)]

	if (len(indices) == 0): # skip this directory: no xmls
		continue

	if (len(files) < 10): # skip these too: Chest xray directory
		continue

	if (len(indices) > 1): # >1 xmls in dir: shouldn't happen
		print("more than 1 xml found in directory", root, "\n", "file indices", indices)

	target_xml = files[indices[0]]
	patient_no = root[root.find("LIDC-IDRI"):root.find("LIDC-IDRI")+14]
	new_filename = patient_no + "_" + target_xml

	#print(new_filename)

	copyfile((root + "/" + target_xml), (out_dir + "/" + new_filename))

	