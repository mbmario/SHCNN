#1/bin/bash

# runs all the programs after compute_normals, because there are no more Matlab programs after that

# IMPORTANT: The SH processor MAY get stuck. Just  Ctrl-C the terminal process and it will jump to the next thread. You can identify them by the last 3 digits of the hex code.

# NEEDS for this script
# python3 (you can probably change delete_spaces_in_filenames first line to python or python2)
# R and Rscript interpreter
# wine
# ./2nd_main_fns

# 1st_main does
# analyze --[matlab fn]-->  off --[shell / meshlabserver]--> processed offs --[matlab fn]--> off & normals

# 2nd_main (THIS PROGRAM) does
# offs and normals (OFF_W_NORM) --[off2Gu.R]--> Gu format meshes (GU_FORMAT) --[GuFormat_to_SHMaps.sh]-->
#--> coefficient text files   (SH_MAPS), useless sphere meshes (SPHERES)
# offs
###### DIRS #####
OFF_W_NORM='/media/mario/DATAPART1/MeshData/OFF_W_NORM' 	# dir of *.off and corresponding _normals.txt files
GU_FORMAT='/media/mario/DATAPART1/MeshData/GU_FORMAT'		# will be single file type: _specialMesh.m (NOT .m as in Matlab)
SH_MAPS='/media/mario/DATAPART1/MeshData/SH_MAPS'			# where the output special mesh stuff will go
SPHERES='/media/mario/DATAPART1/MeshData/SPHERES'


##### BODY #####

cd ./2nd_main_fns

./delete_spaces_in_filenames.py $OFF_W_NORM # "Nodule " -> "Nodule_"

Rscript ./off2Gu.R $OFF_W_NORM $GU_FORMAT # offs and normals conversion to Gu format meshes

./GuFormat_to_SHMaps.sh $GU_FORMAT $SH_MAPS $SPHERES # run the GU Executale!





