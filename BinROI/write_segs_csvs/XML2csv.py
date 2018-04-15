# function that takes  an xmlpath
# creates a directory for the patient
# inside, writes the nodule's coordinates to a csv (x,y,z \n) with names from their patient-ann-nodname
# 2 of 3


def XML2csv (xmlpath, segdir): # 

	import xml.etree.ElementTree as ET
	import read_nod
	from os import mkdir
	from os.path import isdir
	import pdb

	tree = ET.parse(xmlpath)
	root = tree.getroot()
	
	annotator = 0
	patient = xmlpath[xmlpath.find("LIDC-IDRI") + 10: xmlpath.find("LIDC-IDRI") + 14]

	#pdb.set_trace()

	# make directory for patient segs, 
	patient_seg_dir_path = segdir + "/" + patient + "_segmentations"

	if (isdir(patient_seg_dir_path)): # if the patient has already been processed, skip
		return 

	mkdir(patient_seg_dir_path)

	for rs in root: # readingSession starts at [1]

		if (rs.tag.find("readingSession") == -1): # if not a reading session, skip
			continue

		annotator += 1 # increment at each reading session
		
		for nod in rs: # nod = readingSession's CHILDREN, uRN starts at [2]

			if (nod.tag.find("unblindedReadNodule") == -1):
				continue # if not unblindedReadNodule, skip

			nodule_name='RESET'
			nodule_name=nod[0].text 
		
			if (nodule_name.find("Nodule ") != -1): # correct those damn spaces
				nodule_name = nodule_name[0:nodule_name.find("Nodule") + 6] + "_" + nodule_name[nodule_name.find("Nodule") + 7 : len(nodule_name)]
			
			# write patient, annotator, nodulename to file with read_nod
			nodfile_path = patient_seg_dir_path + "/" + patient + "-" + str(annotator) + "-" + nodule_name
			#pdb.set_trace()
			read_nod.read_nod(nod, nodfile_path)	

		# END nods in readingSession for loop

	# END readingSession in root loop
