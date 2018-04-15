% char-annotator_parser.m
% parses the char-annotators from worthless .m files into a table

addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\LIDCtoolbox_mingchen_for_Mario');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Nifti_toolbox');

% set directory, get files
charpath = ('D:\LIDC_subset_751-1012\chars');
cd(charpath);

charfiles = find_files(charpath, '.mat');

% create new results file
fid=fopen('../CAresult.txt', 'w');

% for each file 
for i=1:numel(charfiles)
  % read the mat 
    fprintf(fid, '%s', charfiles{i});
    current = load(charfiles{i});
    for j=1:numel(current.characteristics_array)
        fprintf(fid, '% d', current.characteristics_array(j));
    end
    fprintf(fid, '\r\n');
    %dlmwrite(fid,current.characteristics_array, '-append'); % works when no ML gibberish
    
  % printf to the file
end
fclose('all');

