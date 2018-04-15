% MeshReconstruct.m
% SHs -> offs with different SH compositions

% PARAMETERS: dirs and files
dir = 'E:\3DLIDC_project_E\LIDC_subset_known_diagnosis';
out_dir = 'reconstructed';
targetfile = 'training_file.csv'; % updated Aug 31 (works)
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Mesh_and_SH');
    % contains figures_write.m, read_surf.m, SPHARMconstruct.m, SPHARMcorrespondence.m, SPHARMrepresent2.m
    % SPHARMsmooth.m, SPHARMvectorize.m, Y-l.m

cd(dir); mkdir(out_dir); 

% CSV -> SH MATRIX
SHs = csvread(targetfile, 0,11); %reads the spherical harmonics part, skipoing first 11 non-SH entries
SHs(:,51)=[]; % drop trailing malignancy row
% TESTING: use only <endr> entries
    % endr = 10;
    % SHs((endr+1):size(SHs,1),:)=[]; % drop all columns after endr index 

% CSV -> FILES VECTOR
data = importdata(targetfile);
names = data.textdata;

SHinc = 10; % spherical harmonics to include in reconstruction
for i = 1:size(SHs,1)
    row = SHs(i,1:SHinc); % references first 50 SHs 
    name = [names{i} '-reconstruct']; % LIDC-IDRI-0068-BINARY-ROI-annotator-1-2reconst

end