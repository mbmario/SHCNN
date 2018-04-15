#!/usr/bin/python3

# delete_spaces_in_filenames.py
# for a directory, renames files titles ".*Nodule .*" as ".*Nodule_.*"

import sys
import os
from os import listdir

dire = sys.argv[1]
files = listdir(dire)
for f in files:
	if "Nodule " in f:
		name = f.replace("Nodule ", "Nodule_")
		os.rename(os.path.join(dire, f), os.path.join(dire, name))