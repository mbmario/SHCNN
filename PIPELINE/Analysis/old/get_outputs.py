#!/usr/bin/python3


from os import listdir
from shutil import copyfile

import pdb

# PATH PARAMS -- if you really want, make these args 
headdir = "/media/mario/DiskB/LIDC_Data_Current/RFData/Input_RFParams"
outdir = "/media/mario/DiskB/LIDC_Data_Current/RFData/Results/Input_RFParams"
# END PATH PARAMS

dl1 = listdir(headdir) 

for dl1_item in dl1: 

	dl2 = listdir(headdir + "/" + dl1_item) # ex INPUT_SHCNN/PrC100SH

	for dl2_item in dl2: 
		leaf_path = (headdir + "/" + dl1_item + "/" + dl2_item) # ex INPUT_SHCNN/PrC100SH/t3

		dl3 = listdir(leaf_path) # this will be files 

		for file in dl3: # ex separate 

			#pdb.set_trace()

			if (file.find("Output") != -1 ) : # ignores results of self being run previously

				outname = headdir.split("/")[-1] + "_" + dl1_item + "_" + dl2_item + "_Output.txt"
				#outname = "Output.txt"
				#pdb.set_trace()
				copyfile(leaf_path + "/" + file, outdir + "/" + outname)
