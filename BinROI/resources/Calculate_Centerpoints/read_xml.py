def read_xml(xmlfile):

	import calc_center
	import read_nod

	import xml.etree.ElementTree as ET

	patient_no =  xmlfile[xmlfile.find("LIDC-IDRI")+10:xmlfile.find("LIDC-IDRI")+14]
	nodule_name = 'UNINITIATED'
	centers = (0,0,0)
	annotator = 0
	result = []

	tree = ET.parse(xmlfile)
	root = tree.getroot()

	for rs in root: # readingSession starts at [1]

		if (rs.tag.find("readingSession") == -1): # if not a reading session, skip
			continue

		annotator += 1
		
		for nod in rs: # nod = readingSession's CHILDREN, uRN starts at [2]

			if (nod.tag.find("unblindedReadNodule") == -1):
				continue

			nodule_name='RESET'
			nodule_name=nod[0].text # may want a test if this is erroring or RESET

			if (nodule_name.find("Nodule ") != -1): # correct those damn spaces
				nodule_name = nodule_name[0:nodule_name.find("Nodule") + 6] + "_" + nodule_name[nodule_name.find("Nodule") + 7 : len(nodule_name)]
			
			centers = read_nod.read_nod(nod)

			result.append((patient_no, annotator, nodule_name, centers[0], centers[1], centers[2]))

			# END infos in nod for loop

		# END nods in readingSession for loop

	# END readingSession in root loop
	return result



