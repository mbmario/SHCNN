#!/bin/bash

/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest /home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/ML_input/Char_and_SH_training.csv /home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/ML_input/Char_and_SH_testing.csv 60 "ord[0,9-59],cat[1-8,60]" 0 > /output/Char_and_SH.txt



