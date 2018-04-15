#!/bin/bash

### BEGIN VARS / ARGS ###

if [ $# -ne 3 ]; then 
	echo "please supply args: [1]IN_GU_FORMAT_DIR [2] OUT_HARMONICS_MAP_DIR [3]  OUT_SPHERE_DIR"
fi

WD='./' # working directory. Should not do anything ... if everything is right
INDIR="$1" # where the Gu-format meshes are at (something about Gu_format/.*_specialMesh.m)

OUTDIR="$2" # where the outputted coefficient maps go 
	
SPHEREDIR="$3" # where the (useless?) output colorsphere meshes will go

SHEXE="./RiemannMapper.exe" # Windows executable RiemannMapper -- you must have wine installed! (apt-get wine) 

### END VARS / ARGS ###


### UNIT TEST ###

# cd $WD
# inMESH=/home/mario/Documents/3DLIDC_to_linux/test_cases/copiedGuFormat/LIDC-IDRI-0001-BINARY-ROI-annotator-1-Nodule_001_specialMesh.m # for testing
# inMESH_name=$(basename "$inMESH")
# wine $SHEXE -spherical_harmonic_map $inMESH $SPHEREDIR/out.sphere.m > $OUTDIR/${inMESH_name%.*}_Maps.txt # wineconsole sucks for output; ignore what wine man page says

### END UNIT TEST ###


### FULL FUNCTIONALITY ###
cd $WD
#for file in $(ls $LIDC1) $(ls $LIDC2) $(ls $LIDC3); # will not have full filepaths  
for file in $INDIR/* 
do 
	file_name=$(basename "$file")
	file_sansext=${file_name%.*}
	if [[ $file_sansext == *"specialMesh"* ]]; then
		wine $SHEXE -spherical_harmonic_map $file $SPHEREDIR/${file_sansext}_sphere.m > $OUTDIR/${file_sansext}_Maps.txt
	fi
done  

### END FULL FUNCTIONALITY ###