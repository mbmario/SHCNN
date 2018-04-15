#!/usr/bin/python3

# appends BOTH smallWindows and fullWindows

from os import listdir
from subprocess import call
import sys

sys.path.append("/home/mario/Documents/3D_LIDC_round2/Compile_data") # for our following function
import appendCNNend2

import pdb

### PATH PARAMS ###
headdir = sys.argv[1]

full_image_names = sys.argv[2] 
full_features_fc6 = sys.argv[3]

small_image_names = sys.argv[4]
small_features_fc6 = sys.argv[5]

### END PATH PARAMS ###


#dl1 = listdir(headdir) # 
files = []

#for dl1_item in dl1: 

dl2 = listdir(headdir) # ex INPUT_SHCNN/PrC100SH

for dl2_item in dl2: 
	leaf_path = (headdir + "/" + dl2_item) # ex INPUT_SHCNN/PrC100SH/t3

	dl3 = listdir(leaf_path) # this will be files 

	#pdb.set_trace()

	for file in dl3: # ex separate 

		if (file.find("_pre") != -1): 
			files.append(leaf_path + "/" + file) 
# end for

#pdb.set_trace()


# def appendCNNend (tt_pre, image_names, features_fc6, tt_learnable )
# infile ex: '/media/mario/DATAPART1/RFData/Input_SHCNN/PrC100SH/t5/pc100_18_training_pre.csv'
for infile in files:
	

	middlefile = infile[:len(infile)-8] + "_middle.csv"
	lastfile = infile[:len(infile)-8] + "_learnable.csv"
	#pdb.set_trace()

	appendCNNend2.appendCNNend2(infile, full_image_names, full_features_fc6, middlefile, True)
	appendCNNend2.appendCNNend2(middlefile, small_image_names, small_features_fc6, lastfile, False)




	
	
