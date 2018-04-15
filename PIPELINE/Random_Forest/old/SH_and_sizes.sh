#!/bin/bash

# CTRL - F to change to 50 / 50 / 50 / 50 / 50

date

RF=/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest 

# ARGS2="52 ord[0-51],cat[52] 0"

# 	SPLIT 1
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split1

# 50
ARGS2="52 ord[0-51],cat[52] 0"
touch output/SH_and_sizes_priority_a50.txt
touch output/SH_and_sizes_priority_b50.txt
touch output/SH_and_sizes_priority_c50.txt

$RF SH_and_sizes_priority_a50_learnable_training.csv SH_and_sizes_priority_a50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a50.txt

$RF SH_and_sizes_priority_b50_learnable_training.csv SH_and_sizes_priority_b50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b50.txt

$RF SH_and_sizes_priority_c50_learnable_training.csv SH_and_sizes_priority_c50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c50.txt

# 100
ARGS2="102 ord[0-101],cat[102] 0"
touch output/SH_and_sizes_priority_a100.txt
touch output/SH_and_sizes_priority_b100.txt
touch output/SH_and_sizes_priority_c100.txt

$RF SH_and_sizes_priority_a100_learnable_training.csv SH_and_sizes_priority_a100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a100.txt

$RF SH_and_sizes_priority_b100_learnable_training.csv SH_and_sizes_priority_b100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b100.txt

$RF SH_and_sizes_priority_c100_learnable_training.csv SH_and_sizes_priority_c100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c100.txt

# 150
ARGS2="152 ord[0-151],cat[152] 0"
touch output/SH_and_sizes_priority_a150.txt
touch output/SH_and_sizes_priority_b150.txt
touch output/SH_and_sizes_priority_c150.txt

$RF SH_and_sizes_priority_a150_learnable_training.csv SH_and_sizes_priority_a150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a150.txt

$RF SH_and_sizes_priority_b150_learnable_training.csv SH_and_sizes_priority_b150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b150.txt

$RF SH_and_sizes_priority_c150_learnable_training.csv SH_and_sizes_priority_c150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c150.txt

# 200
ARGS2="202 ord[0-201],cat[202] 0"
touch output/SH_and_sizes_priority_a200.txt
touch output/SH_and_sizes_priority_b200.txt
touch output/SH_and_sizes_priority_c200.txt

$RF SH_and_sizes_priority_a200_learnable_training.csv SH_and_sizes_priority_a200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a200.txt

$RF SH_and_sizes_priority_b200_learnable_training.csv SH_and_sizes_priority_b200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b200.txt

$RF SH_and_sizes_priority_c200_learnable_training.csv SH_and_sizes_priority_c200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c200.txt

# 400
ARGS2="402 ord[0-401],cat[402] 0"
touch output/SH_and_sizes_priority_a400.txt
touch output/SH_and_sizes_priority_b400.txt
touch output/SH_and_sizes_priority_c400.txt

$RF SH_and_sizes_priority_a400_learnable_training.csv SH_and_sizes_priority_a400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a400.txt

$RF SH_and_sizes_priority_b400_learnable_training.csv SH_and_sizes_priority_b400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b400.txt

$RF SH_and_sizes_priority_c400_learnable_training.csv SH_and_sizes_priority_c400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c400.txt

# SPLIT 2
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split2

# 50
ARGS2="52 ord[0-51],cat[52] 0"
touch output/SH_and_sizes_priority_a50.txt
touch output/SH_and_sizes_priority_b50.txt
touch output/SH_and_sizes_priority_c50.txt

$RF SH_and_sizes_priority_a50_learnable_training.csv SH_and_sizes_priority_a50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a50.txt

$RF SH_and_sizes_priority_b50_learnable_training.csv SH_and_sizes_priority_b50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b50.txt

$RF SH_and_sizes_priority_c50_learnable_training.csv SH_and_sizes_priority_c50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c50.txt

# 100
ARGS2="102 ord[0-101],cat[102] 0"
touch output/SH_and_sizes_priority_a100.txt
touch output/SH_and_sizes_priority_b100.txt
touch output/SH_and_sizes_priority_c100.txt

$RF SH_and_sizes_priority_a100_learnable_training.csv SH_and_sizes_priority_a100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a100.txt

$RF SH_and_sizes_priority_b100_learnable_training.csv SH_and_sizes_priority_b100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b100.txt

$RF SH_and_sizes_priority_c100_learnable_training.csv SH_and_sizes_priority_c100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c100.txt

# 150
ARGS2="152 ord[0-151],cat[152] 0"
touch output/SH_and_sizes_priority_a150.txt
touch output/SH_and_sizes_priority_b150.txt
touch output/SH_and_sizes_priority_c150.txt

$RF SH_and_sizes_priority_a150_learnable_training.csv SH_and_sizes_priority_a150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a150.txt

$RF SH_and_sizes_priority_b150_learnable_training.csv SH_and_sizes_priority_b150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b150.txt

$RF SH_and_sizes_priority_c150_learnable_training.csv SH_and_sizes_priority_c150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c150.txt

# 200
ARGS2="202 ord[0-201],cat[202] 0"
touch output/SH_and_sizes_priority_a200.txt
touch output/SH_and_sizes_priority_b200.txt
touch output/SH_and_sizes_priority_c200.txt

$RF SH_and_sizes_priority_a200_learnable_training.csv SH_and_sizes_priority_a200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a200.txt

$RF SH_and_sizes_priority_b200_learnable_training.csv SH_and_sizes_priority_b200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b200.txt

$RF SH_and_sizes_priority_c200_learnable_training.csv SH_and_sizes_priority_c200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c200.txt

# 400
ARGS2="402 ord[0-401],cat[402] 0"
touch output/SH_and_sizes_priority_a400.txt
touch output/SH_and_sizes_priority_b400.txt
touch output/SH_and_sizes_priority_c400.txt

$RF SH_and_sizes_priority_a400_learnable_training.csv SH_and_sizes_priority_a400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a400.txt

$RF SH_and_sizes_priority_b400_learnable_training.csv SH_and_sizes_priority_b400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b400.txt

$RF SH_and_sizes_priority_c400_learnable_training.csv SH_and_sizes_priority_c400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c400.txt

# SPLIT 3
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split3

# 50
ARGS2="52 ord[0-51],cat[52] 0"
touch output/SH_and_sizes_priority_a50.txt
touch output/SH_and_sizes_priority_b50.txt
touch output/SH_and_sizes_priority_c50.txt

$RF SH_and_sizes_priority_a50_learnable_training.csv SH_and_sizes_priority_a50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a50.txt

$RF SH_and_sizes_priority_b50_learnable_training.csv SH_and_sizes_priority_b50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b50.txt

$RF SH_and_sizes_priority_c50_learnable_training.csv SH_and_sizes_priority_c50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c50.txt

# 100
ARGS2="102 ord[0-101],cat[102] 0"
touch output/SH_and_sizes_priority_a100.txt
touch output/SH_and_sizes_priority_b100.txt
touch output/SH_and_sizes_priority_c100.txt

$RF SH_and_sizes_priority_a100_learnable_training.csv SH_and_sizes_priority_a100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a100.txt

$RF SH_and_sizes_priority_b100_learnable_training.csv SH_and_sizes_priority_b100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b100.txt

$RF SH_and_sizes_priority_c100_learnable_training.csv SH_and_sizes_priority_c100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c100.txt

# 150
ARGS2="152 ord[0-151],cat[152] 0"
touch output/SH_and_sizes_priority_a150.txt
touch output/SH_and_sizes_priority_b150.txt
touch output/SH_and_sizes_priority_c150.txt

$RF SH_and_sizes_priority_a150_learnable_training.csv SH_and_sizes_priority_a150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a150.txt

$RF SH_and_sizes_priority_b150_learnable_training.csv SH_and_sizes_priority_b150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b150.txt

$RF SH_and_sizes_priority_c150_learnable_training.csv SH_and_sizes_priority_c150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c150.txt

# 200
ARGS2="202 ord[0-201],cat[202] 0"
touch output/SH_and_sizes_priority_a200.txt
touch output/SH_and_sizes_priority_b200.txt
touch output/SH_and_sizes_priority_c200.txt

$RF SH_and_sizes_priority_a200_learnable_training.csv SH_and_sizes_priority_a200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a200.txt

$RF SH_and_sizes_priority_b200_learnable_training.csv SH_and_sizes_priority_b200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b200.txt

$RF SH_and_sizes_priority_c200_learnable_training.csv SH_and_sizes_priority_c200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c200.txt

# 400
ARGS2="402 ord[0-401],cat[402] 0"
touch output/SH_and_sizes_priority_a400.txt
touch output/SH_and_sizes_priority_b400.txt
touch output/SH_and_sizes_priority_c400.txt

$RF SH_and_sizes_priority_a400_learnable_training.csv SH_and_sizes_priority_a400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a400.txt

$RF SH_and_sizes_priority_b400_learnable_training.csv SH_and_sizes_priority_b400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b400.txt

$RF SH_and_sizes_priority_c400_learnable_training.csv SH_and_sizes_priority_c400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c400.txt


# SPLIT 4
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split4

# 50
ARGS2="52 ord[0-51],cat[52] 0"
touch output/SH_and_sizes_priority_a50.txt
touch output/SH_and_sizes_priority_b50.txt
touch output/SH_and_sizes_priority_c50.txt

$RF SH_and_sizes_priority_a50_learnable_training.csv SH_and_sizes_priority_a50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a50.txt

$RF SH_and_sizes_priority_b50_learnable_training.csv SH_and_sizes_priority_b50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b50.txt

$RF SH_and_sizes_priority_c50_learnable_training.csv SH_and_sizes_priority_c50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c50.txt

# 100
ARGS2="102 ord[0-101],cat[102] 0"
touch output/SH_and_sizes_priority_a100.txt
touch output/SH_and_sizes_priority_b100.txt
touch output/SH_and_sizes_priority_c100.txt

$RF SH_and_sizes_priority_a100_learnable_training.csv SH_and_sizes_priority_a100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a100.txt

$RF SH_and_sizes_priority_b100_learnable_training.csv SH_and_sizes_priority_b100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b100.txt

$RF SH_and_sizes_priority_c100_learnable_training.csv SH_and_sizes_priority_c100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c100.txt

# 150
ARGS2="152 ord[0-151],cat[152] 0"
touch output/SH_and_sizes_priority_a150.txt
touch output/SH_and_sizes_priority_b150.txt
touch output/SH_and_sizes_priority_c150.txt

$RF SH_and_sizes_priority_a150_learnable_training.csv SH_and_sizes_priority_a150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a150.txt

$RF SH_and_sizes_priority_b150_learnable_training.csv SH_and_sizes_priority_b150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b150.txt

$RF SH_and_sizes_priority_c150_learnable_training.csv SH_and_sizes_priority_c150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c150.txt

# 200
ARGS2="202 ord[0-201],cat[202] 0"
touch output/SH_and_sizes_priority_a200.txt
touch output/SH_and_sizes_priority_b200.txt
touch output/SH_and_sizes_priority_c200.txt

$RF SH_and_sizes_priority_a200_learnable_training.csv SH_and_sizes_priority_a200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a200.txt

$RF SH_and_sizes_priority_b200_learnable_training.csv SH_and_sizes_priority_b200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b200.txt

$RF SH_and_sizes_priority_c200_learnable_training.csv SH_and_sizes_priority_c200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c200.txt

# 400
ARGS2="402 ord[0-401],cat[402] 0"
touch output/SH_and_sizes_priority_a400.txt
touch output/SH_and_sizes_priority_b400.txt
touch output/SH_and_sizes_priority_c400.txt

$RF SH_and_sizes_priority_a400_learnable_training.csv SH_and_sizes_priority_a400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a400.txt

$RF SH_and_sizes_priority_b400_learnable_training.csv SH_and_sizes_priority_b400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b400.txt

$RF SH_and_sizes_priority_c400_learnable_training.csv SH_and_sizes_priority_c400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c400.txt


# SPLIT 5
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_and_sizes/split5

# 50
ARGS2="52 ord[0-51],cat[52] 0"
touch output/SH_and_sizes_priority_a50.txt
touch output/SH_and_sizes_priority_b50.txt
touch output/SH_and_sizes_priority_c50.txt

$RF SH_and_sizes_priority_a50_learnable_training.csv SH_and_sizes_priority_a50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a50.txt

$RF SH_and_sizes_priority_b50_learnable_training.csv SH_and_sizes_priority_b50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b50.txt

$RF SH_and_sizes_priority_c50_learnable_training.csv SH_and_sizes_priority_c50_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c50.txt

# 100
ARGS2="102 ord[0-101],cat[102] 0"
touch output/SH_and_sizes_priority_a100.txt
touch output/SH_and_sizes_priority_b100.txt
touch output/SH_and_sizes_priority_c100.txt

$RF SH_and_sizes_priority_a100_learnable_training.csv SH_and_sizes_priority_a100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a100.txt

$RF SH_and_sizes_priority_b100_learnable_training.csv SH_and_sizes_priority_b100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b100.txt

$RF SH_and_sizes_priority_c100_learnable_training.csv SH_and_sizes_priority_c100_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c100.txt

# 150
ARGS2="152 ord[0-151],cat[152] 0"
touch output/SH_and_sizes_priority_a150.txt
touch output/SH_and_sizes_priority_b150.txt
touch output/SH_and_sizes_priority_c150.txt

$RF SH_and_sizes_priority_a150_learnable_training.csv SH_and_sizes_priority_a150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a150.txt

$RF SH_and_sizes_priority_b150_learnable_training.csv SH_and_sizes_priority_b150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b150.txt

$RF SH_and_sizes_priority_c150_learnable_training.csv SH_and_sizes_priority_c150_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c150.txt

# 200
ARGS2="202 ord[0-201],cat[202] 0"
touch output/SH_and_sizes_priority_a200.txt
touch output/SH_and_sizes_priority_b200.txt
touch output/SH_and_sizes_priority_c200.txt

$RF SH_and_sizes_priority_a200_learnable_training.csv SH_and_sizes_priority_a200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a200.txt

$RF SH_and_sizes_priority_b200_learnable_training.csv SH_and_sizes_priority_b200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b200.txt

$RF SH_and_sizes_priority_c200_learnable_training.csv SH_and_sizes_priority_c200_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c200.txt

# 400
ARGS2="402 ord[0-401],cat[402] 0"
touch output/SH_and_sizes_priority_a400.txt
touch output/SH_and_sizes_priority_b400.txt
touch output/SH_and_sizes_priority_c400.txt

$RF SH_and_sizes_priority_a400_learnable_training.csv SH_and_sizes_priority_a400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_a400.txt

$RF SH_and_sizes_priority_b400_learnable_training.csv SH_and_sizes_priority_b400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_b400.txt

$RF SH_and_sizes_priority_c400_learnable_training.csv SH_and_sizes_priority_c400_learnable_testing.csv $ARGS2  > output/SH_and_sizes_priority_c400.txt


date