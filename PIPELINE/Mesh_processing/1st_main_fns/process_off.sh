#!/bin/bash

# parent script to run meshlabserver with the mlx scripts
# mlx should be OK if they are in functions subdirectory

if [ $# -ne 3 ]; then
	echo "not enough args: INDIR, OUTDIR, FILTERCODE"
	exit
fi

SMOOTH_MLX=/home/mario/Documents/3D_LIDC_round2/Mesh_processing/1st_main_fns/LaplacianFilter.mlx
HnI_MLX=/home/mario/Documents/3D_LIDC_round2/Mesh_processing/1st_main_fns/Holes_n_Islands.mlx
ALL_MLX=/home/mario/Documents/3D_LIDC_round2/Mesh_processing/1st_main_fns/All_Filters.mlx
INDIR="$1"
OUTDIR="$2"



if  [ "$3" == "0" ]; then
	# just copy everything and be done with it
	cp -rf $INDIR/* $OUTDIR   
	exit
fi


for f in ${INDIR}/* ; do 
	#echo $f
	outname="proc_"$(basename $f)
	if [ "$3" == 1 ]; then
		meshlabserver -i $f -o $OUTDIR$outname -s "$SMOOTH_MLX"
	elif [ "$3" == 2 ]; then
		meshlabserver -i $f -o $OUTDIR$outname -s "$HnI_MLX"
	else # [ "$3" == 3 ]
		meshlabserver -i $f -o $OUTDIR$outname -s "$ALL_MLX"
	fi
done

