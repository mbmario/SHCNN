% main code that patches together stuff for shape analysis project
% Mario Buty 2/9/2015
% analyze(HDR/img) -> nii -> .off -[MeshLab: correct normals and shrink]-> corrected .off -> add normals -[off2Gu.R]-> 
% special mesh -[Gu program]-> Harmonics, texture sphere

% ideas

% try/catch move into did_not_work subdirectory
% some way to stop execution of Gu program if it doesn't work (system shell?)
%    otherwise have to run in groups and move occasional ones that don't
%    work


filepath = 'D:\LIDC_subset_751-1012\BINARY-ROIs'; % CONTAINS THE DATA TO READ (will build temp sub-dirs)
outpath =  'D:\LIDC_subset_751-1012\BINARY-ROIs_Gu_Format';

for i = 1 % to collapse file paths
% path to target analyze files - PARENT OF HDRs/IMGs


% below should not change

% path to Spherical Harmonic Batch 
SHM = 'E:\3DLIDC_project_E\programs_windows\SphericalHarmonicMapper.bat';
% refs RiemannMapper in E:\3D_Shapes_Project\Gu_items\ReimannMapper\bin

% path to Rscript.exe: allows R scripts to be executed in ML via command line 
Rscript = 'C:\Users\butymd\Documents\R\R-3.1.2\bin\Rscript.exe';

% path to the R scirpt itself
Rpath = 'E:\3DLIDC_project_E\programs_windows\off2Gu.R';

% various Matlab toolboxes paths that have been used
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\LIDC_toolbox');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Nifti_toolbox');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\toolbox_graph');
addpath('E:\3DLIDC_project_E\programs_windows\ML_toolboxes\Misc_toolbox');
addpath('E:\3DLIDC_project_E\programs_windows');
end

%%%%%%%%%%

% WRITE ANALYZE TO .OFF (and normals) -- TAKES A LONG TIME
% goes to filepath, makes off dir with results
cd(filepath);
files = dir('*.hdr');
mkdir('off'); % to contain normals and off files
for file = files' 
   disp(strcat(file.name, '...'));
   [pathstr, name, ext] = fileparts(file.name);
   
    % changed: nii2mesh (commented out save); write_off added, faces
    % rearranged
   [vertex face] = nii2mesh(load_nii(file.name), strcat('./off/' ,name, '.off'), 0.5); % SAVE COMMENTED OUT
   face = face(:,[3 2 1]); % flips normals
   write_off([pathstr './off/' name '.off'], vertex, face);
   disp('saved');
end
disp('offs complete'); disp(' ');


%%%%%%%%%%

% large meshes need reduction: use Meshlab
% normals -> invert
% smooth -> laplacian
% reduce -> Quadric edge decimation
% OR use OpenFlipper
% OR program in a Matlab reduce

%%%%%%%%%%

% NORMALS
cd([filepath '\off']);
files = dir('*.off');
for file = files' 
   disp(['computing normals of ' file.name, '...']);   
   [pathstr, name, ext] = fileparts(file.name);
   [vertex face] = read_off(file.name);   % saves off files to off subdirectory
   [normal,normalf] = compute_normal(vertex,face); % normal = vertex normals, normalf = face normals (don't need)
   normal = normal';
   dlmwrite([name, '_normal.txt'], normal);
   disp('saved');
end

%%%%%%%%%%



%   WRITE OFF TO GU FORMAT - USES R, DOESN'T TAKE QUITE AS LONG 
% makes output directory away from the data, under outpath and named after
% the filepath
[pathstr name] = fileparts(filepath);
mkdir(outpath, [name '_Gu_format'])
outpath_child = [outpath  '\' name '_Gu_format']; % directory made
    
% R script: given parent directory, turns them into the final form
disp('R program running:');
% R program loops over all files in directory already
system([Rscript ' ' Rpath ' ' filepath ' ' outpath_child]);

%%%%%%%%%% 

% RUN THE PYTHON SCRIPT TO GET RID OF THE (OCCASIONAL FILENAME) SPACES!!!

Gu_format_folder = outpath_child; % i.e. [outpath  'BINARY-ROIs_Gu_format\'];
    % which is output from previous block
 
% TEMP FULL RUN VARS
Gu_format_folder = 'D:\LIDC_subset_1-200\BINARY-ROIs_Gu_Format';  
    
cd(Gu_format_folder);
files = dir(Gu_format_folder); % don't have to modify anything
mkdir([Gu_format_folder '/SHs']); % writes to here
mkdir([Gu_format_folder '/spheres']);
mkdir([Gu_format_folder '/done']);


failure_ct = 0;
for file = files' 
   if ~(strcmp(file.name,'.') || strcmp(file.name, '..'))
       disp('Computing SH map of '); disp(file.name);
       [pathstr, name, ext] = fileparts(file.name);
       command = ['call ' SHM ' ' Gu_format_folder '\' name];
       [status, cmdout] = system(command); % stealthily creates ./..._sphecialMesh.sphere.m
       if ((status ~= 0) || ~isempty(strfind(cmdout, 'Error')) ) % failure
           disp('SH map .exe failed');
           failure_ct = failure_ct + 1;
           if (status ~= 0) % Did Not Execute
                fclose(fopen(['./SHs/' name '_DNE.txt'], 'w')); % creates new empty faiurefile 
           elseif ~isempty(strfind(cmdout, 'Error')) % coun't find file or something
                fclose(fopen(['./SHs/' name '_ERROR.txt'], 'w')); % creates new empty faiurefile
           end
           if (failure_ct > 1) 
                break; % when it's not writing any more, kill it! 
           end
       else % success
           failure_ct = 0;
           dlmwrite(['./' name, '_Maps.txt'], cmdout, 'delimiter', '');
       end
       spherefile = [name '.sphere.m'];
       if (exist(spherefile, 'file') == 2) % it really should
           movefile(spherefile, ['./spheres/' spherefile]);
       end 
       movefile(file.name, ['./done/' file.name]); % move into done so you don't have to when it crashes  
       movefile([name '_Maps.txt'], ['./SHs/' name '_Maps.txt']); % move into done so you don't have to when it crashes  

   end % end if that screens for '.' and '..' "files"
end % end for loop over files

