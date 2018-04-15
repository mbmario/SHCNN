#!/usr/bin/python3

# moves dicoms out of their stupid sub folders of INDIR and moves the >10 file folders to a retitled dicomdir in OUTDIR

INDIR="/media/mario/DATAPART1/LIDC_dicom"
OUTDIR="/media/mario/DATAPART1/LIDC_dicom_org"

import os
import shutil
import pdb

switch = 'a' # deal with those pesky double-scan patients

for root, subdirs, files in os.walk(INDIR):

	#pdb.set_trace()
	patient_name = root[root.find("LIDC-IDRI-") + 10: root.find("LIDC-IDRI-") + 14]

	if ((len(files) > 10) & (len(subdirs)==0 ) ): 

		#pdb.set_trace()

		if (switch == 'a'): switch = 'b'
		elif (switch == 'b'): switch = 'c'
		else: switch = 'a' 

		#print(switch)

		shutil.copytree(root, OUTDIR + "/"  + patient_name + "_" + switch + "/")