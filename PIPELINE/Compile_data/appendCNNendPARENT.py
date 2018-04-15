#!/usr/bin/python3

# probably easy to copy this and use it for the shell script that runs the RF

from os import listdir
from subprocess import call
import sys

sys.path.append("/home/mario/Documents/3D_LIDC_round2/Compile_data") # for our following function
import appendCNNend

import pdb

### PATH PARAMS ###
image_names = sys.argv[2] #"/media/mario/DATAPART1/RFData/Raw_Data/SmallWindows/image_names.csv"
features_fc6 = sys.argv[3] #"/media/mario/DATAPART1/RFData/Raw_Data/SmallWindows/features_fc6.csv"
headdir = sys.argv[1] #"/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly"
if (int(sys.argv[4]) == 0): # 1 = yes, 2 = no
	SHinc = False
else: 
	SHinc = True
### END PATH PARAMS ###


#dl1 = listdir(headdir) # 
files = []

#for dl1_item in dl1: 

dl2 = listdir(headdir) # ex INPUT_SHCNN/PrC100SH

	# if (dl1_item.find("CNN") == -1):
	# 	continue

for dl2_item in dl2: 
	leaf_path = (headdir + "/" + dl2_item) # ex INPUT_SHCNN/PrC100SH/t3

	dl3 = listdir(leaf_path) # this will be files 

	#pdb.set_trace()

	for file in dl3: # ex separate 

		if (file.find("_pre")): # ignores results of self being run previously
			files.append(leaf_path + "/" + file) 
# end for

#pdb.set_trace()

path =''; fname =''; outname='' # init vars 

# def appendCNNend (tt_pre, image_names, features_fc6, tt_learnable )
# infile ex: '/media/mario/DATAPART1/RFData/Input_SHCNN/PrC100SH/t5/pc100_18_training_pre.csv'
for infile in files:
	
	#[path, fname] = infile.rsplit('/', 1)  
	
	outname = infile[:len(infile)-8] + "_learnable.csv"
	#pdb.set_trace()

	appendCNNend.appendCNNend(infile, image_names, features_fc6, outname, SHinc)
	#command = appendCNNend + " " + " " + infile + " " + image_names + " " + features_fc6 + " " + outname
	#call(command, shell=True)




	
	
