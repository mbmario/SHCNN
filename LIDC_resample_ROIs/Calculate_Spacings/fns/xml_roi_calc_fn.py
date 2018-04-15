def roi_calc_fn (nod):
	# nod is a RT Element with tag <unblindedReadNodule>

	# if roi has a specified roi range, it will return the dimensions as a tuple
	#	 -> (x width, y width, z width) in milimeters
	
	# if it does NOT, then it will return (0,0,0)
	import numpy

	#import pdb

	# THIS WORKS, but in the future to make it run faster, change insert to some sort of faster change operation, and resize the array if it runs out of room

	initial_size = 1000
	initial_size_z = 100

	#if this is too slow, try initializing them as some sort of rep NaN and 
	x_ = numpy.empty((1, initial_size))
	x_[:] = numpy.NaN
	x_i = 0

	y_ = numpy.empty((1, initial_size))
	y_[:] = numpy.NaN
	y_i = 0

	z_ = numpy.empty((1, 100))
	z_[:] = numpy.NaN
	z_i = 0

	for info in nod: # same loop as before because roi is broken up by z-value

		if (info.tag.find("roi") == -1 ): # if its not an roi dont deal with it here
			continue

		for roi_sub in info: # roi_sub can be imageZposition (to z_), edgeMap(to x_ and y_), SOP_UID (garbage), or inclusion (garbage)

			if (roi_sub.tag.find("imageZ") != -1):
				z_ = numpy.insert(z_, z_i, float(roi_sub.text))
				z_i += 1

			if (roi_sub.tag.find("edgeMap") != -1):
				x_ = numpy.insert(x_, x_i, float(roi_sub[0].text))
				x_i += 1

				y_ = numpy.insert(y_, y_i, float(roi_sub[1].text))
				y_i += 1

				#if the nan count  == 0, expand the both arrays with more nans

		### END roi_sub in info loop

	### END info in nod for loop
	
	#pdb.set_trace()
		
	x_range = (numpy.nanmax(x_) - numpy.nanmin(x_))
	y_range = (numpy.nanmax(y_) - numpy.nanmin(y_))
	z_range = (numpy.nanmax(z_) - numpy.nanmin(z_))
	
	pass
	return (x_range, y_range, z_range)
	# return max - min to all arrays in a tuple