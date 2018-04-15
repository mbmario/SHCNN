#!/usr/bin/python3

# xml_UT.py: runs one instance of xml_roi_calc_fn, for testing

import xml.etree.ElementTree as ET
import xml_roi_calc_fn
import numpy
import pdb
import os

os.chdir('/home/mario/Documents/LIDC_resample_ROIs/fns')
xmlfile = "/media/mario/DATAPART1/LIDC_xml/LIDC-IDRI-0001_069.xml"

tree = ET.parse(xmlfile)
root = tree.getroot()

good_ex = root[1][2]
bad_ex =  root[1][3]

pdb.set_trace()

result = xml_roi_calc_fn.roi_calc_fn(good_ex)

pass

pdb.set_trace()

bad_result = xml_roi_calc_fn.roi_calc_fn(bad_ex)

pass


