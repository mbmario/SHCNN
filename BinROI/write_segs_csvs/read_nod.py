#!/usr/bin/python3
# 3 of 3

import numpy
import math
import pdb

def process_slice(pts, z, pts_idx, outfile):
# fills in the points and writes to the outfile
	
	origidx = pts_idx
	if (pts_idx <= 1):
		return 

	pts = pts[0:(pts_idx-1),]

	#xmax = pts[:,0].max()
	ymax = pts[:,1].max()
	#xmin = pts[:,0].min()
	ymin = pts[:,1].min()

	y_range = ymax - ymin + 1
	#x_range = xmax - xmin + 1

	# min/max x values on the y axis of the z slice
	minony = numpy.empty(y_range)*numpy.nan 
	maxony = numpy.empty(y_range)*numpy.nan

	#pdb.set_trace()

	for row in pts: # go thru and set the minony and maxony
		x = row[0]
		y = row[1]
		#z = row[2]

		v_idx = int(y - ymin) # index corr to the y-value 
		#print("v_idx:", v_idx, "yminmax", ymin, ymax)

		# min update condition
		if ((x < minony[v_idx]) | math.isnan(minony[v_idx])):
			minony[v_idx] = x

		# max update condition
		if ((x > maxony[v_idx]) | math.isnan(maxony[v_idx])):
			maxony[v_idx] = x

	# end for row in pts

	z = pts[0,2] # should be constant through whole fn
	

	for v_idx in range(0, len(minony)): # print all the points between minony anx maxony for set y,z
		
		#pdb.set_trace()
		if (numpy.isnan(minony[v_idx]) | numpy.isnan(maxony[v_idx]) ):
			continue # if for some reason there isn't anything there, skip it now

		y = v_idx + ymin # opposite of what we did earlier 

		# FIGURE THIS OUT AND DEBUG IT
		#pdb.set_trace()
		for x in range(int(minony[v_idx]), int(maxony[v_idx]) + 1): 
			outfile.write(str(x) + "," + str(y) + "," + str(z) + "\n")


	# end for idx in minony/maxony






##########################################################################################

def read_nod (nod, filename): # nod = unblindedReadNodule

	with open(filename, 'a') as outfile:

		x=0.0;y=0.0;z=0.0
		pts = numpy.zeros((200,3)) # empty 500 x 3; is a vector of x,y pts
		pts_idx = 0	

		for roi in nod: # EACH ROI

			if (roi.tag.find("roi") == -1):
				continue

			# at this point nod_info must be "roi"
			for roi_info in roi: # roi info e {imageZposition, imageSOP_UID, inclusion, edgeMap}

				#pdb.set_trace()
				# create empty array

				if (roi_info.tag.find("imageZposition") != -1 ): # new z slice
					
					#pdb.set_trace()
					# process slice
					if (pts.sum() != 0.0): # skip initial case
						process_slice(pts, z, pts_idx, outfile) # maybe return a tuple for max/min?

					# update and reset in all cases
					pts.fill(0) 
					pts_idx = 0						
					z = (float)(roi_info.text)

				if (roi_info.tag.find("edgeMap") != -1 ):

					x = (float)(roi_info[0].text) # extract x,y; put in array		
					y = (float)(roi_info[1].text)
					pts[pts_idx, 0] = x
					pts[pts_idx, 1] = y
					pts[pts_idx, 2] = z
					pts_idx += 1

					if ((pts_idx + 1) == pts.shape[0]): # reached size of array
						pts.resize(len(pts[:,0]) + 200, 3)

		# END FOR roi_info in roi
	# END FOR roi in nod
	return 
