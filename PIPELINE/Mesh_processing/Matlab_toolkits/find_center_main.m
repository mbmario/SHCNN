% find_center_main.m
% parent to find_center.m
% copied from chop_annotators_script.m

addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Nifti_toolbox');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\LIDCtoolbox_mingchen_for_Mario');
addpath('E:\3DLIDC_project_E\programs_windows\');

% PATH VARS
%LIDC_path=('E:\3DLIDC_project_E\LIDC_subset_known_diagnosis\annotations_mingchen_outputs');
dicomdir='O:\DMprj\MarioProjects\HDOVRFLOW\LIDC_subset_1-200\dicoms';
outfile = 'O:\DMprj\MarioProjects\HDOVRFLOW\LIDC_subset_1-200\centers.csv';

cd(dicomdir); 
dicoms = dir();
    % WARNING: if there are any files in dicomdir, Matlab will interpret it as a structure instead of a cell,
    % messing up the following loop:

 % file stuff
 if (exist(outfile, 'file') == 2)  % delete it if it is there
     fclose(outfile); % just in case
     delete(outfile);
 end
 fout = fopen(outfile, 'wt');   

for dicom_num = 1:numel(dicoms) 
    name = getfield(dicoms, {dicom_num}, 'name');
    if (numel(name) > 3) % elim "./", "../", other cases
        find_center(name, fout);
        % output files are 'FORMAT XXXX'
    end
end

fclose(fout); 
