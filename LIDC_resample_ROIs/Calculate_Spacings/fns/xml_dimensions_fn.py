#!/usr/bin/python3

def xml_dimensions_fn (xmlfile, print_flag):
	# xmlfile should be a full path, print is boolean 

	# return object is a list of tuples
	# 	where each tuple is (patient_no, nodule_name, x_len, y_len, z_len )

	import xml.etree.ElementTree as ET
	import xml_roi_calc_fn
	#import pdb

	patient_no =  xmlfile[xmlfile.find("LIDC-IDRI")+10:xmlfile.find("LIDC-IDRI")+14]
	nodule_name = 'UNINITIATED'
	roi= (0,0,0)

	#pdb.set_trace()

	tree = ET.parse(xmlfile)
	root = tree.getroot()

	result = [] # list of tuples

	# HIERARCHY:
	#  root /
	#		rs (target is readingSession)
	#			nod (target is unblindedReadNodule) -> roi_calc_fn
	#				info (target is nodule_name AND roi)

	for rs in root:

		if (rs.tag.find("readingSession") == -1): # if not a reading session, skip
			continue

		if print_flag: print("selected rs", rs.tag)

		for nod in rs: # nod = readingSession's CHILDREN

			if (nod.tag.find("unblindedReadNodule") == -1 ): # if not an unblindedReadNodule, skip (annotation vsn, rad id, nonnodule)
				continue

			if print_flag: print("\t selected nod", nod.tag)

			for info in nod: #  info = unbilindedReadNodule's CHILDREN
							 #  use all noduleID, roi stuff

				if print_flag: print("\t \t potential info", info.tag)
				
				if (info.tag.find("noduleID") != -1): # if it IS noduleID tag

					nodule_name = info.text

					if (nodule_name.find("Nodule ") != -1): # correct those damn spaces
						nodule_name = nodule_name[0:nodule_name.find("Nodule") + 6] + "_" + nodule_name[nodule_name.find("Nodule") + 7 : len(nodule_name)]
					
					if print_flag: print("\t \t \t selected nodule_name", nodule_name)	

				if (info.tag.find("roi")):
					roi = xml_roi_calc_fn.roi_calc_fn(nod)	# [0] x_range, [1] y_range, [2] z_range

			# END infos in nod for loop

			# this should execute after compiling names and rois (info elements) for the nodule:
			if (roi[0] != 0 ): # if it is a point ROI, this code should not execute
				result.append((patient_no, nodule_name, roi[0], roi[1], roi[2]))
			# reset parameters in any case, for smooth debugging
			nodule_name = 'RESET'
			roi = (0,0,0)

		# END nods in readingSession for loop

	# END readingSession in root loop
	
	return result


