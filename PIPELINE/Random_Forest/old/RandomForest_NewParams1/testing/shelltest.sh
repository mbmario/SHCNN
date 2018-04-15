#!/bin/bash

TRAINING="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_training_learnable.csv"
TESTING="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_testing_learnable.csv"
OUT="/home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/Output.txt"

../build/RandomForest $TRAINING $TESTING 4096 "ord[0-4095],cat[4096]" 0 > $OUT

# gdb  /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_training_learnable.csv /home/mario/Documents/LIDC_Code_Current/RandomForest_Experimentation/testing/PrA400SH/t1/pa400_18_testing_learnable.csv 4096 ord[0-4095],cat[4096] 1