OFFDIR="/media/mario/DATAPART1/April_LIDC_run/OFFs"
OFF_DIR_PROCESSED="/media/mario/DATAPART1/April_LIDC_run/OFFS_DIR_PROCESSED/"
PROC_SHELL="/home/mario/Documents/3D_LIDC_round2/Mesh_processing/1st_main_fns/process_off.sh"
PROC_LVL=3


# IN SOME RARE CASES "CLOSE HOLES" MAY PRODUCE AN ERROR ON NON 2-MANIFOLD SURFACES OR SOMETHING (WORKS 98.5% of LIDC cases)

# You might want to pipe output to /dev/null because there is a lot
 $PROC_SHELL $OFFDIR $OFF_DIR_PROCESSED $PROC_LVL