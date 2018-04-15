#!/usr/bin/python3

	# -designate x= /xml/, an= /nonbinROI/, seg = /segcsvs/patient, broi = /binary-rois/
	# 	-can use regular analyze but would take longer!
	# -find appropriate xfile, anfile, and  segfile
	# -for each 
	# 	-for each nodule-specific file produced by child and associated an
	# 		ITKprogram: given segfile, an, broi name, writes broi 

### FILES /###
# in
binarize = "/home/mario/Documents/3D_LIDC_round2/BinROI/ITKbinarize/build/binarize"
andir = "/media/mario/DATAPART1/LIDC_Analyze/LIDC_Analyze" # also have isotropic
segsout = "/media/mario/DATAPART1/BinROI_data/seg_csvs" # will have patient subdirs
# out
BINARYROIs = "/media/mario/DATAPART1/BinROI_data/BINARY-ROIs/" 
###/ FILES ###

from os import listdir, stat
from subprocess import  call
import pdb

anfiles = listdir(andir)
segpatient_dirs = listdir(segsout)

for patient in segpatient_dirs:
	
	# nodule is the individual 
	patient_path_in = segsout + "/" + patient
	nodules = listdir(patient_path_in)
	
	for nodule in nodules:

		# now we have the correct nodule
		nodule_path_in = patient_path_in + "/" + nodule
		
		nodfs = stat(nodule_path_in).st_size
		if (nodfs < 100 ): # very small or nonexistent nodule: skip
			continue

		# get the correct analyze
		corr_anfile = "null"
		for anfile in anfiles:
			if (anfile.find(patient[0:4]) != -1):
				corr_anfile = andir + "/" + anfile
				break

		#pdb.set_trace()

		# set the outpath 
		outname = BINARYROIs + "/" + nodule + ".hdr"

		# execute the command
		# shell: $exe $testin_an $testin_csv $testout
		command = binarize + " " + corr_anfile + " " + nodule_path_in + " " + outname
		call(command, shell=True)	







