#!/usr/bin/python3

from os import rename, listdir

cd = "/media/mario/DATAPART1/RFData/Raw_Data/SHs/"
SHfiles = listdir(cd)

for file in SHfiles:
	rename(cd + file, cd +file[5:])