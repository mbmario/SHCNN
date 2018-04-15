#!/usr/bin/python3

from os import listdir
from subprocess import call
import sys 
import pdb
import datetime
import linecache

build="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/build/RandomForest"
intrain="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_training_learnable.csv"
intest="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_testing_learnable.csv"
outname="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/Output.txt"

#// ARGUMENTS(10): [0] Randomforest.cxx, [1] training csv, [2] testing csv, [3] response index, [4] variable types string, [5] print extra output (1 == print, ~1 == don't),
# opt[6] maxDepth, [7] minSampleCount, [8] maxCategories, [9] nactiveVars

# code copied from 

# get maligspot
line = linecache.getline(intest, 1)
maligspot = line.count(",") # line.split(,)[maligspot] = malig value

# get the description parameter right
maligspot_minus1_str = str(maligspot - 1)
maligspot_str = str(maligspot) 
desc  = "ord[0-" + maligspot_minus1_str + "]," + "cat[" + maligspot_str + "]" # there should be no cat besides malig

#pdb.set_trace()
command =  build + " " + intrain + " " + intest + " " + maligspot_str + " " + desc + " " + "0"  +  " " + ">" + " " + outname

call(command, shell=True)

# COMMAND: /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/build/RandomForest /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_training_learnable.csv /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_testing_learnable.csv 4096 ord[0-4095],cat[4096] 0 > /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/Output.txt