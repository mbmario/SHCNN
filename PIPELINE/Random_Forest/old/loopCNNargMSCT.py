#!/usr/bin/python3

# probably easy to copy this and use it for the shell script that runs the RF

from os import listdir
from subprocess import call
import sys 

import datetime
import linecache

import pdb

# PATH PARAMS 
RFpath = ""#"/home/mario/Documents/LIDC_Code_Current/PIPELINE/Random_Forest/RandomForest_Experimentation/build/RandomForest"
if (len(sys.argv) == 1):
 	headdir = "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly"
 	sys.exit("SUPPLY ARGS FOR THIS VERSION: 1 datadir, 2 RFPath, 3 outpath")
else:
	headdir = sys.argv[2]
	RFpath = sys.argv[3]
	outpath = sys.argv[4]
	minSampleCT = sys.argv[1]
# END PATH PARAMS

#dl1 = listdir(headdir) # 
testing = []; training = []

#for dl1_item in dl1: 

dl2 = listdir(headdir) # ex INPUT_SHCNN/PrC100SH

for dl2_item in dl2: 

	#pdb.set_trace()	
	leaf_path = (headdir + "/" + dl2_item) # ex INPUT_SHCNN/PrC100SH/t3
	dl3 = listdir(leaf_path)

	for file in dl3: # ex separate 

		#pdb.set_trace()
		if (file.find("_learnable") != -1 ) : # ignores results of self being run previously
			if (file.find('testing') != -1 ):
				testing.append(leaf_path + "/" + file)
			if (file.find("training") != -1 ):
				training.append(leaf_path + "/" + file)
				
# end for

#pdb.set_trace()
if (len(testing) != len(training)):
	sys.exit("testing and training differ in length: serious problem")

outfile=''; desc=''; maligspot=-1 # init vars 
for i in range(len(testing)):
	
	# get maligspot (starting from 0-index)
	line = linecache.getline(testing[i], 1)
	maligspot = line.count(",") # line.split(,)[maligspot] = malig value

	#pdb.set_trace()

	# get output name (testing file arbitrarily chosen)
	[path, fname] = testing[i].rsplit('/', 1)  
	modelname = fname[:fname.find("testing")]
	testname = path[-2:]
	outname = outpath  + "/" + modelname + "_" + testname + "_Output.txt"

	# get the description parameter right
	maligspot_minus1_str = str(maligspot - 1)
	maligspot_str = str(maligspot) 
	desc  = "ord[0-" + maligspot_minus1_str + "]," + "cat[" + maligspot_str + "]" # there should be no cat besides malig

	addlparams = " 25 " + minSampleCT + " 15 " + "0 " + "300"

	command =  RFpath + " " + training[i] + " " + testing[i] + " " + maligspot_str + " " + desc + " " + "0"  +  " " + ">" + " " + outname + addlparams
	#pdb.set_trace()
	print(datetime.datetime.now())
	print("running RF on", path)
	call(command, shell=True)



	
	
