
# for each nodule (tuple) in list_patient (list), find corresponding nodules 
# 	while the list is nonempty, prints the first nodules searches over the list for nodules that 
# 	are close to it, printing those too.

def printlist ( list_patient, level, sensitive ):

	import pdb
	#pdb.set_trace()

	while (list_patient != []): # while list of nodules is nonempty
		
		base_nodule = list_patient[0] # compare other nodules to the base_nodule

		base_annotator = base_nodule[1]
		base_x= float(base_nodule[2])
		base_y= float(base_nodule[3])
		base_z= float(base_nodule[4])
		base_name = base_nodule[5]

		patient = base_nodule[0] # should be constant for each call of this fn

		print(base_name, ",", -1, ",", patient, ",", level)

		temp_list = list_patient.copy() # iterate thru copy, alter list_nodule
			# shallow copy like this seems to be OK
	
		for nodule in temp_list: # go thru and compare nodules to base
		
			target_nodule = nodule
			target_annotator = target_nodule[1]
			target_x= float(target_nodule[2])
			target_y= float(target_nodule[3])
			target_z= float(target_nodule[4])
			target_name = target_nodule[5]

			dist = ((base_x-target_x)**2 + (base_y-target_y)**2 + (base_z-target_z)**2)**.5
			dist = round(dist, 3)
				# Euclidean distance between the front of the list and pt on the list


			if ((float(dist) < float(sensitive)) &  (int(base_annotator) != int(target_annotator))):
				#print("BELOW THRESHOLD, ADDING")
				print(target_name, "," , dist, ",", patient, ",", level)
				print(target_annotator, base_annotator)
				list_patient.remove(nodule)

			# end if
		
		# end for loop

		level += 1
		list_patient.remove(base_nodule)

	# end while loop

# end function


