#!/bin/bash

# no spaces!

touch output/Char_and_SH_priority_a.txt # overwritten later in case they exist
touch output/Char_and_SH_priority_b.txt
touch output/Char_and_SH_priority_c.txt
touch output/Char_and_SH_priority_d.txt

RF=/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest 

ARGS2="60 ord[0,9-59],cat[1-8,60] 0"

cd /home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/ML_input/Char_and_SH/

$RF priority_a_learnable_training.csv priority_a_learnable_testing.csv $ARGS2  > output/Char_and_SH_priority_a.txt

$RF priority_b_learnable_training.csv priority_b_learnable_testing.csv $ARGS2  > output/Char_and_SH_priority_b.txt

$RF priority_c_learnable_training.csv priority_c_learnable_testing.csv $ARGS2  > output/Char_and_SH_priority_c.txt

$RF priority_d_learnable_training.csv priority_d_learnable_testing.csv $ARGS2  > output/Char_and_SH_priority_d.txt


