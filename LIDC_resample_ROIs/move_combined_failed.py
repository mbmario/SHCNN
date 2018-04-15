#!/usr/bin/python3

COMBINEDDIR="/media/mario/DATAPART1/LIDC_bmp_combined/"
REJECTDIR="/media/mario/DATAPART1/LIDC_slices_mystery/"

from shutil import copyfile
from os import listdir, remove

attempts = listdir(COMBINEDDIR)

for attempt in attempts:
	if ((attempt.find("linear-0") != -1) | (attempt.find("linear-1") != -1) | (attempt.find("linear-2") != -1) ):
		copyfile(COMBINEDDIR + attempt, REJECTDIR + attempt)
		remove(COMBINEDDIR + attempt)

