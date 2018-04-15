% 3compute_normals_main.m
% split from 1st_main.m because matlab failed to run the mesh loop

% takes a relatively long time (~5 min / 100 cases)

cd('/home/mario/Documents/3D_LIDC_round2/Mesh_processing/');
addpath('/home/mario/Documents/3D_LIDC_round2/Mesh_processing/1st_main_fns'); % addpath must be FULL address
addpath('/home/mario/Documents/3D_LIDC_round2/Mesh_processing/Matlab_toolkits/Misc_toolbox');
addpath('/home/mario/Documents/3D_LIDC_round2/Mesh_processing/Matlab_toolkits/toolbox_graph');

OFF_DIR_PROCESSED='/media/mario/DATAPART1/MeshData/OFF_DIR_PROCESSED/';
OFF_W_NORM='/media/mario/DATAPART1/MeshData/OFF_W_NORM/';

compute_normals(OFF_DIR_PROCESSED, OFF_W_NORM);  