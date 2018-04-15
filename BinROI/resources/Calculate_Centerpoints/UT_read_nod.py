#!/usr/bin/python3

import os
import xml.etree.ElementTree as ET
import read_nod

#import pdb
xmlfile="/media/mario/DATAPART1/LIDC_TEST/LIDC-IDRI-0001_069.xml"

tree = ET.parse(xmlfile)
root = tree.getroot()

nod = root[1][2]
#pdb.set_trace()
centers = read_nod.read_nod(nod)
print(centers[0], centers[1], centers[2])
