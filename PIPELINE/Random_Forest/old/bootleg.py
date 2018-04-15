#!/usr/bin/python3

infile = "/media/mario/DATAPART1/RFData/Input_CNNonly/PrACNN/t1/pa0_18_training_learnable.csv"
outfile = "/media/mario/DATAPART1/RFData/Input_CNNonly/PrACNN/t1/test_training_out.csv"


with open(infile, mode ='r') as readfile:
	for line in readfile:
		with open(outfile, mode='w') as writefile:
			writefile.write('1,' + line)
