#!/bin/bash

# CTRL - F to change to 50 / 50 / 50 / 50 / 50

date

RF=/home/mario/Documents/3DLIDC_project_local/programs_linux/RandomForest/RandomForest/build/src/RandomForest 

# ARGS2="50 ord[0-49],cat[50] 0"

# 	SPLIT 1
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only_model/split1

# 50
ARGS2="50 ord[0-49],cat[50] 0"
touch output/SH_only_model_priority_a50.txt
touch output/SH_only_model_priority_b50.txt
touch output/SH_only_model_priority_c50.txt

$RF SH_only_model_priority_a50_learnable_training.csv SH_only_model_priority_a50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a50.txt

$RF SH_only_model_priority_b50_learnable_training.csv SH_only_model_priority_b50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b50.txt

$RF SH_only_model_priority_c50_learnable_training.csv SH_only_model_priority_c50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c50.txt

# 100
ARGS2="100 ord[0-99],cat[100] 0"
touch output/SH_only_model_priority_a100.txt
touch output/SH_only_model_priority_b100.txt
touch output/SH_only_model_priority_c100.txt

$RF SH_only_model_priority_a100_learnable_training.csv SH_only_model_priority_a100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a100.txt

$RF SH_only_model_priority_b100_learnable_training.csv SH_only_model_priority_b100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b100.txt

$RF SH_only_model_priority_c100_learnable_training.csv SH_only_model_priority_c100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c100.txt

# 150
ARGS2="150 ord[0-149],cat[150] 0"
touch output/SH_only_model_priority_a150.txt
touch output/SH_only_model_priority_b150.txt
touch output/SH_only_model_priority_c150.txt

$RF SH_only_model_priority_a150_learnable_training.csv SH_only_model_priority_a150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a150.txt

$RF SH_only_model_priority_b150_learnable_training.csv SH_only_model_priority_b150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b150.txt

$RF SH_only_model_priority_c150_learnable_training.csv SH_only_model_priority_c150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c150.txt

# 200
ARGS2="200 ord[0-199],cat[200] 0"
touch output/SH_only_model_priority_a200.txt
touch output/SH_only_model_priority_b200.txt
touch output/SH_only_model_priority_c200.txt

$RF SH_only_model_priority_a200_learnable_training.csv SH_only_model_priority_a200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a200.txt

$RF SH_only_model_priority_b200_learnable_training.csv SH_only_model_priority_b200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b200.txt

$RF SH_only_model_priority_c200_learnable_training.csv SH_only_model_priority_c200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c200.txt

# 400
ARGS2="400 ord[0-399],cat[400] 0"
touch output/SH_only_model_priority_a400.txt
touch output/SH_only_model_priority_b400.txt
touch output/SH_only_model_priority_c400.txt

$RF SH_only_model_priority_a400_learnable_training.csv SH_only_model_priority_a400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a400.txt

$RF SH_only_model_priority_b400_learnable_training.csv SH_only_model_priority_b400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b400.txt

$RF SH_only_model_priority_c400_learnable_training.csv SH_only_model_priority_c400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c400.txt

# SPLIT 2
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only_model/split2

# 50
ARGS2="50 ord[0-49],cat[50] 0"
touch output/SH_only_model_priority_a50.txt
touch output/SH_only_model_priority_b50.txt
touch output/SH_only_model_priority_c50.txt

$RF SH_only_model_priority_a50_learnable_training.csv SH_only_model_priority_a50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a50.txt

$RF SH_only_model_priority_b50_learnable_training.csv SH_only_model_priority_b50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b50.txt

$RF SH_only_model_priority_c50_learnable_training.csv SH_only_model_priority_c50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c50.txt

# 100
ARGS2="100 ord[0-99],cat[100] 0"
touch output/SH_only_model_priority_a100.txt
touch output/SH_only_model_priority_b100.txt
touch output/SH_only_model_priority_c100.txt

$RF SH_only_model_priority_a100_learnable_training.csv SH_only_model_priority_a100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a100.txt

$RF SH_only_model_priority_b100_learnable_training.csv SH_only_model_priority_b100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b100.txt

$RF SH_only_model_priority_c100_learnable_training.csv SH_only_model_priority_c100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c100.txt

# 150
ARGS2="150 ord[0-149],cat[150] 0"
touch output/SH_only_model_priority_a150.txt
touch output/SH_only_model_priority_b150.txt
touch output/SH_only_model_priority_c150.txt

$RF SH_only_model_priority_a150_learnable_training.csv SH_only_model_priority_a150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a150.txt

$RF SH_only_model_priority_b150_learnable_training.csv SH_only_model_priority_b150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b150.txt

$RF SH_only_model_priority_c150_learnable_training.csv SH_only_model_priority_c150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c150.txt

# 200
ARGS2="200 ord[0-199],cat[200] 0"
touch output/SH_only_model_priority_a200.txt
touch output/SH_only_model_priority_b200.txt
touch output/SH_only_model_priority_c200.txt

$RF SH_only_model_priority_a200_learnable_training.csv SH_only_model_priority_a200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a200.txt

$RF SH_only_model_priority_b200_learnable_training.csv SH_only_model_priority_b200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b200.txt

$RF SH_only_model_priority_c200_learnable_training.csv SH_only_model_priority_c200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c200.txt

# 400
ARGS2="400 ord[0-399],cat[400] 0"
touch output/SH_only_model_priority_a400.txt
touch output/SH_only_model_priority_b400.txt
touch output/SH_only_model_priority_c400.txt

$RF SH_only_model_priority_a400_learnable_training.csv SH_only_model_priority_a400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a400.txt

$RF SH_only_model_priority_b400_learnable_training.csv SH_only_model_priority_b400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b400.txt

$RF SH_only_model_priority_c400_learnable_training.csv SH_only_model_priority_c400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c400.txt

# SPLIT 3
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only_model/split3

# 50
ARGS2="50 ord[0-49],cat[50] 0"
touch output/SH_only_model_priority_a50.txt
touch output/SH_only_model_priority_b50.txt
touch output/SH_only_model_priority_c50.txt

$RF SH_only_model_priority_a50_learnable_training.csv SH_only_model_priority_a50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a50.txt

$RF SH_only_model_priority_b50_learnable_training.csv SH_only_model_priority_b50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b50.txt

$RF SH_only_model_priority_c50_learnable_training.csv SH_only_model_priority_c50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c50.txt

# 100
ARGS2="100 ord[0-99],cat[100] 0"
touch output/SH_only_model_priority_a100.txt
touch output/SH_only_model_priority_b100.txt
touch output/SH_only_model_priority_c100.txt

$RF SH_only_model_priority_a100_learnable_training.csv SH_only_model_priority_a100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a100.txt

$RF SH_only_model_priority_b100_learnable_training.csv SH_only_model_priority_b100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b100.txt

$RF SH_only_model_priority_c100_learnable_training.csv SH_only_model_priority_c100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c100.txt

# 150
ARGS2="150 ord[0-149],cat[150] 0"
touch output/SH_only_model_priority_a150.txt
touch output/SH_only_model_priority_b150.txt
touch output/SH_only_model_priority_c150.txt

$RF SH_only_model_priority_a150_learnable_training.csv SH_only_model_priority_a150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a150.txt

$RF SH_only_model_priority_b150_learnable_training.csv SH_only_model_priority_b150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b150.txt

$RF SH_only_model_priority_c150_learnable_training.csv SH_only_model_priority_c150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c150.txt

# 200
ARGS2="200 ord[0-199],cat[200] 0"
touch output/SH_only_model_priority_a200.txt
touch output/SH_only_model_priority_b200.txt
touch output/SH_only_model_priority_c200.txt

$RF SH_only_model_priority_a200_learnable_training.csv SH_only_model_priority_a200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a200.txt

$RF SH_only_model_priority_b200_learnable_training.csv SH_only_model_priority_b200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b200.txt

$RF SH_only_model_priority_c200_learnable_training.csv SH_only_model_priority_c200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c200.txt

# 400
ARGS2="400 ord[0-399],cat[400] 0"
touch output/SH_only_model_priority_a400.txt
touch output/SH_only_model_priority_b400.txt
touch output/SH_only_model_priority_c400.txt

$RF SH_only_model_priority_a400_learnable_training.csv SH_only_model_priority_a400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a400.txt

$RF SH_only_model_priority_b400_learnable_training.csv SH_only_model_priority_b400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b400.txt

$RF SH_only_model_priority_c400_learnable_training.csv SH_only_model_priority_c400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c400.txt


# SPLIT 4
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only_model/split4

# 50
ARGS2="50 ord[0-49],cat[50] 0"
touch output/SH_only_model_priority_a50.txt
touch output/SH_only_model_priority_b50.txt
touch output/SH_only_model_priority_c50.txt

$RF SH_only_model_priority_a50_learnable_training.csv SH_only_model_priority_a50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a50.txt

$RF SH_only_model_priority_b50_learnable_training.csv SH_only_model_priority_b50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b50.txt

$RF SH_only_model_priority_c50_learnable_training.csv SH_only_model_priority_c50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c50.txt

# 100
ARGS2="100 ord[0-99],cat[100] 0"
touch output/SH_only_model_priority_a100.txt
touch output/SH_only_model_priority_b100.txt
touch output/SH_only_model_priority_c100.txt

$RF SH_only_model_priority_a100_learnable_training.csv SH_only_model_priority_a100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a100.txt

$RF SH_only_model_priority_b100_learnable_training.csv SH_only_model_priority_b100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b100.txt

$RF SH_only_model_priority_c100_learnable_training.csv SH_only_model_priority_c100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c100.txt

# 150
ARGS2="150 ord[0-149],cat[150] 0"
touch output/SH_only_model_priority_a150.txt
touch output/SH_only_model_priority_b150.txt
touch output/SH_only_model_priority_c150.txt

$RF SH_only_model_priority_a150_learnable_training.csv SH_only_model_priority_a150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a150.txt

$RF SH_only_model_priority_b150_learnable_training.csv SH_only_model_priority_b150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b150.txt

$RF SH_only_model_priority_c150_learnable_training.csv SH_only_model_priority_c150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c150.txt

# 200
ARGS2="200 ord[0-199],cat[200] 0"
touch output/SH_only_model_priority_a200.txt
touch output/SH_only_model_priority_b200.txt
touch output/SH_only_model_priority_c200.txt

$RF SH_only_model_priority_a200_learnable_training.csv SH_only_model_priority_a200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a200.txt

$RF SH_only_model_priority_b200_learnable_training.csv SH_only_model_priority_b200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b200.txt

$RF SH_only_model_priority_c200_learnable_training.csv SH_only_model_priority_c200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c200.txt

# 400
ARGS2="400 ord[0-399],cat[400] 0"
touch output/SH_only_model_priority_a400.txt
touch output/SH_only_model_priority_b400.txt
touch output/SH_only_model_priority_c400.txt

$RF SH_only_model_priority_a400_learnable_training.csv SH_only_model_priority_a400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a400.txt

$RF SH_only_model_priority_b400_learnable_training.csv SH_only_model_priority_b400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b400.txt

$RF SH_only_model_priority_c400_learnable_training.csv SH_only_model_priority_c400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c400.txt


# SPLIT 5
cd /home/mario/Documents/3DLIDC_project_local/ML_input/SH_only_model/split5

# 50
ARGS2="50 ord[0-49],cat[50] 0"
touch output/SH_only_model_priority_a50.txt
touch output/SH_only_model_priority_b50.txt
touch output/SH_only_model_priority_c50.txt

$RF SH_only_model_priority_a50_learnable_training.csv SH_only_model_priority_a50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a50.txt

$RF SH_only_model_priority_b50_learnable_training.csv SH_only_model_priority_b50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b50.txt

$RF SH_only_model_priority_c50_learnable_training.csv SH_only_model_priority_c50_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c50.txt

# 100
ARGS2="100 ord[0-99],cat[100] 0"
touch output/SH_only_model_priority_a100.txt
touch output/SH_only_model_priority_b100.txt
touch output/SH_only_model_priority_c100.txt

$RF SH_only_model_priority_a100_learnable_training.csv SH_only_model_priority_a100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a100.txt

$RF SH_only_model_priority_b100_learnable_training.csv SH_only_model_priority_b100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b100.txt

$RF SH_only_model_priority_c100_learnable_training.csv SH_only_model_priority_c100_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c100.txt

# 150
ARGS2="150 ord[0-149],cat[150] 0"
touch output/SH_only_model_priority_a150.txt
touch output/SH_only_model_priority_b150.txt
touch output/SH_only_model_priority_c150.txt

$RF SH_only_model_priority_a150_learnable_training.csv SH_only_model_priority_a150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a150.txt

$RF SH_only_model_priority_b150_learnable_training.csv SH_only_model_priority_b150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b150.txt

$RF SH_only_model_priority_c150_learnable_training.csv SH_only_model_priority_c150_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c150.txt

# 200
ARGS2="200 ord[0-199],cat[200] 0"
touch output/SH_only_model_priority_a200.txt
touch output/SH_only_model_priority_b200.txt
touch output/SH_only_model_priority_c200.txt

$RF SH_only_model_priority_a200_learnable_training.csv SH_only_model_priority_a200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a200.txt

$RF SH_only_model_priority_b200_learnable_training.csv SH_only_model_priority_b200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b200.txt

$RF SH_only_model_priority_c200_learnable_training.csv SH_only_model_priority_c200_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c200.txt

# 400
ARGS2="400 ord[0-399],cat[400] 0"
touch output/SH_only_model_priority_a400.txt
touch output/SH_only_model_priority_b400.txt
touch output/SH_only_model_priority_c400.txt

$RF SH_only_model_priority_a400_learnable_training.csv SH_only_model_priority_a400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_a400.txt

$RF SH_only_model_priority_b400_learnable_training.csv SH_only_model_priority_b400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_b400.txt

$RF SH_only_model_priority_c400_learnable_training.csv SH_only_model_priority_c400_learnable_testing.csv $ARGS2  > output/SH_only_model_priority_c400.txt


date