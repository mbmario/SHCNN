#!/usr/bin/python3

import sys
import string

# distances.py
# 	For files with <name> <x> <y> <z> \n for each nodule of 1 patient
# 	Computes distances between all nodules

path = sys.argv[1]

csvfile = open(path)

for line in csvfile:

	base = line.split(" ")
	csvfile2 = open(path)

	for line2 in csvfile2:

		target = line2.split(" ")

		dist = ( (float(base[1])-float(target[1]))**2 + (float(base[2])-float(target[2]))**2 
			+ (float(base[3])-float(target[3]))**2 )**.5

		if (type(dist) == complex):
			print("IMAGINARY CASE; STRINGS:")
			print("base", base)
			print("target", target)
			print("FLOATS")
			print("base", float(base[1]), float(base[2]), float(base[3]))
			print("target", float(target[1]), float(target[2]), float(target[3]))


		print(base[0], target[0], dist)

