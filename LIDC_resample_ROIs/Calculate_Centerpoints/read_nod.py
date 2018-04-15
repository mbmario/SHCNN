def read_nod (nod):

	import numpy

	# takes a guaranteed <unblindedReadNodule>
	# returns a tuple of centers 

	# array initialization
	x_arr = numpy.empty((1,0))
	x_i = 0

	y_arr = numpy.empty((1,0))
	y_i = 0

	z_arr = numpy.empty((1,0))
	z_i = 0


	for roi in nod:

		if (roi.tag.find("roi") == -1):
			continue

		# at this point nod_info must be "roi"
		for roi_info in roi: # roi info e {imageZposition, imageSOP_UID, inclusion, edgeMap}

			if (roi_info.tag.find("imageZposition") != -1 ):
				z_arr = numpy.insert(z_arr, z_i, float(roi_info.text))
				z_i += 1

			if (roi_info.tag.find("edgeMap") != -1):
				x = roi_info[0].text
				x_arr = numpy.insert(x_arr, x_i, float(x))
				x_i += 1

				y = roi_info[1].text
				y_arr = numpy.insert(y_arr, y_i, float(y))
				y_i += 1

		# END FOR roi_info in roi
	# END FOR roi in nod


	x_range = (numpy.nanmax(x_arr) + numpy.nanmin(x_arr))/2
	y_range = (numpy.nanmax(y_arr) + numpy.nanmin(y_arr))/2
	z_range = (numpy.nanmax(z_arr) + numpy.nanmin(z_arr))/2

	return (x_range, y_range, z_range)
