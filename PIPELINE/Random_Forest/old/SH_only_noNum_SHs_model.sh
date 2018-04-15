#!/bin/bash

touch output/SH_only_priority_c.txt

RF=/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest 

ARGS2="51 ord[0-50],cat[51] 0"

cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only/

$RF SH_only_priority_c_learnable_training.csv SH_only_priority_c_learnable_testing.csv $ARGS2  > output/SH_only_priority_c.txt