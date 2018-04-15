def appendCNNend2(tt_pre, image_names, features_fc6, tt_learnable, keyinc):

# once this works, comment out the args and write it as a function

	import sys
	import csv
	import linecache

	import pdb

	# step 1: read the image_names file as a dictionary

	cnndict = {}; idx = 0; entry = ''; target ='' # init var for dict


	with open(image_names, mode='r') as infile:
		for line in infile:
			entry = line
			target = entry[entry.find("LIDC_bmp_combined")+18:entry.find("-ROI_")]
			#pdb.set_trace()
			cnndict[target] = idx
			idx = idx + 1
		#end for
	# end with


	# step 2: for each line in the tt_pre:
	#	take the filename
	# 	write the rest of the tt_pre line to tt_learnable without EOL
	# 	find the index from the dictionary corresponding to the filename
	# 	get the line of the features csv
	# 	write that line to tt_learnable with EOL

	first = ''; rest = ''; key = ''; idx = 0; split = 0; malig = -1 # init var for loop

	#pdb.set_trace()
	with open(tt_pre, mode='r') as csvreadfile:
		for csvline in csvreadfile:
			
			# process the csvline into all the stuff we need
			split = csvline.find(",") # first occurance of ","
			key = csvline[0:split] # ex 'LIDC-IDRI-0344-BINARY-ROI-annotator-1-57469'
			malig = csvline[len(csvline)-2:len(csvline)-1] # put this at the end!
			rest = csvline[split+1:len(csvline)-3] # raw SH data

			# process "key" so that it looks like ####-<ann#>-<name>
			if (keyinc): # case: first pass
				key = key[10:14] + key[key.find("annotator")+9:]
			else: # case: second pass (key is already formatted)
				pass
			#pdb.set_trace()

			# find the dictionary entry corresponding to "key"
			if (not(key in cnndict)): # move on if it's not there
				continue 
			idx = cnndict[key]
			
			# get the corresponding line from the big matrix
			matline = linecache.getline(features_fc6, idx + 1) # to make up for 0-based indexing
			matline = matline[:len(matline)-1]
			#pdb.set_trace()


			with open(tt_learnable, mode='a') as csvwritefile:
				if (keyinc):
					csvwritefile.write(key +"," + rest + ',' + matline + ','+  malig + '\n')
				else:
					csvwritefile.write(rest + ',' + matline + ','+  malig + '\n')
				
	return None

	