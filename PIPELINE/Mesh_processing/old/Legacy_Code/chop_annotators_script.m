% chop_annotators_script.m
% parent script for LIDC_annotations_binary
% writes .*char-annotator.* and .*BINARY-ROI-annotator.* to dicom directory

% DIRECTORIES
LIDC_path=('O:\DMprj\MarioProjects\HDOVRFLOW\LIDC_subset_751-1012\done'); % LOCATION OF ANALYZE FILES
dicomdir=('O:\DMprj\MarioProjects\HDOVRFLOW\LIDC_subset_751-1012\dicoms'); % LOCATION OF DICOMS

addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\LIDCtoolbox_mingchen_for_Mario');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Nifti_toolbox');
addpath('E:\3DLIDC_project_E\programs_windows\');

cd(LIDC_path);
BA_files = find_files(LIDC_path, '.hdr', {}, '-binary-annotator-');

% make a characteristics dir and a BINARY-ROIs dir under outdir

for BA_num = 597: numel(BA_files) 
    if (numel(findstr('-binary-annotator-', BA_files{BA_num})) ~= 0)
        LIDC_annotations_binary(BA_files{BA_num}, dicomdir);
        % output files are 'LIDC-IDRI-<patient number>-BINARY-ROI-annotator-<annotator number>-<nodule name>'
    end
end