#!/usr/bin/python3
# 1 of 3
# parent for XML2csv that loops over all the XMLS

### FILES / ###
# in
#xmldir = "/media/mario/DATAPART1/LIDC_xml"
xmldir = "/home/mario/Documents/3D_LIDC_round2/BinROI/data/LIDC_xml"

# out
#segs_csvs_path = "/media/mario/DATAPART1/BinROI_data/seg_csvs"
segs_csvs_path = "/home/mario/Documents/3D_LIDC_round2/BinROI/data/seg_csvs"
### / FILES ###

import XML2csv
from os import listdir
import pdb 

#pdb.set_trace()
xml_files = listdir(xmldir)

for file in xml_files:
	
	if (file.find("xml") == -1):
		continue # skip non-xml files

	#pdb.set_trace()
	XML2csv.XML2csv(xmldir + "/" + file, segs_csvs_path)
