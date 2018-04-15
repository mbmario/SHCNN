% 1analyze_thru_off_main.m
% FORMERLY 1st_main.m; runs only analyze to off now  

% NEEDED for LATER programs 
% 	 Meshlabserver
%   Rscript executable that runs R programs
%   Python3
%   wine

cd('/home/mario/Documents/3D_LIDC_round2/Mesh_processing/');
addpath('./1st_main_fns');
addpath('./Matlab_toolkits/Nifti_toolbox');
addpath('./Matlab_toolkits');

% DIRECTORIES: see line 4 for placement on pipeline
BROI_DIR='xxx'; % BINARY ROIS - SOURCE IF BUILDING FROM THERE
OFF_DIR='/media/mario/DATAPART1/LIDC_OFFS/SMALL_SET_OFFS/'; % SOURCE IF BUILDING STRAIGHT FROM MESHES
%OFF_DIR_PROCESSED='/media/mario/DATAPART1/LIDC_OFFS/OFF_DIR_PROCESSED/';
%OFF_W_NORM='/media/mario/DATAPART1/LIDC_OFFS/OFF_W_NORM/';


 %%% BODY %%%

% input format is Binary-ROIs. Run 0_LIDC_annotations_mingchen.m (included) if this is not the case

analyze_to_off(BROI_DIR, OFFDIR); % SKIP IF YOU HAVE OFFS. Hopefully you won't have to do this again!


% MATLAB IS UNABLE TO RUN THE 
%proc_lvl=1; % 0: (do nothing), 1 (smooth only), 2 (fill holes & remove islands only),  3 or anything else (smooth, fill holes, and remove islands)
%cmd=['./1st_main_fns/process_off.sh ' OFF_DIR ' ' OFF_DIR_PROCESSED ' ' num2str(proc_lvl)];
%system('./1st_main_fns/workaround.sh'); 

# split into another matlab script
%compute_normals(OFF_DIR_PROCESSED, OFF_W_NORM);




