#!/usr/bin/python3

# probably easy to copy this and use it for the shell script that runs the RF

from os import listdir
from subprocess import call
from sys import exit

import datetime
import linecache

import pdb

# PATH PARAMS 
RFpath = "/home/mario/Documents/3D_LIDC_round2/Random_Forest/RandomForest/build/src/RandomForest"

headdir = "/media/mario/DATAPART1/RFData/Input_CNNonly"
# END PATH PARAMS

dl1 = listdir(headdir) # 
testing = []; training = []

for dl1_item in dl1: 

	dl2 = listdir(headdir + "/" + dl1_item) # ex INPUT_SHCNN/PrC100SH

	for dl2_item in dl2: 
		leaf_path = (headdir + "/" + dl1_item + "/" + dl2_item) # ex INPUT_SHCNN/PrC100SH/t3

		dl3 = listdir(leaf_path) # this will be files 

		for file in dl3: # ex separate 

			if (file.find("_learnable") != -1 ) : # ignores results of self being run previously
				if (file.find('testing') != -1 ):
					testing.append(leaf_path + "/" + file)
				if (file.find("training") != -1 ):
					training.append(leaf_path + "/" + file)
				
# end for

if (len(testing) != len(training)):
	exit("testing and training differ in length: serious problem")

outfile=''; desc=''; maligspot=-1 # init vars 
for i in range(len(testing)):
	
	# get maligspot (starting from 0-index)
	line = linecache.getline(testing[i], 1)
	maligspot = line.count(",") # line.split(,)[maligspot] = malig value

	# get output name
	[path, fname] = testing[i].rsplit('/', 1)  
	outname = path + "/" + "Output.txt"

	# get the description parameter right
	maligspot_minus1_str = str(maligspot - 1)
	maligspot_str = str(maligspot) 
	desc  = "ord[0-" + maligspot_minus1_str + "]," + "cat[" + maligspot_str + "]" # there should be no cat besides malig

	#pdb.set_trace()

	command =  RFpath + " " + training[i] + " " + testing[i] + " " + maligspot_str + " " + desc + " " + "0"  +  " " + ">" + " " + outname
	#pdb.set_trace()
	print(datetime.datetime.now())
	print("running RF on", path)
	call(command, shell=True)



	
	
