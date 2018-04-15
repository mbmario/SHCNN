#!/bin/bash

touch output/Char_only_priority_c.txt

RF=/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest 

ARGS2="8 cat[0-8] 0"

cd /home/mario/Documents/3DLIDC_project_local/ML_input/Char_only

$RF Char_only_priority_c_learnable_training.csv Char_only_priority_c_learnable_testing.csv $ARGS2  > output/Char_only_priority_c.txt