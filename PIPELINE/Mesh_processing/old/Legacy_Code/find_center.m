% find_center.m
% child to find_center.m
% copied from LIDC_annotations_binary

function [] = find_center(pat_dicomdir, fout) 
% dicom_path: path to pat_dicomdir
%  pat_dicomdir: patient directory with dicoms; e.g. LIDC-IDRI-XXXX/ 
%  LIDC_path: directory that has all the analyze files 

% get specific xml cooresponding to Chest CT: xml_path filename
xml_files = find_files(['./' pat_dicomdir], '.xml');  
num = numel(xml_files);
if (num~=1 && num ~=2)
    fprintf('Only %d xml files found; aborting find_center for patient %s \n', numel(xml_files), pat_dicomdir); 
    return;
else if (numel(xml_files) == 1)
    [xml_path, filename] = fileparts(xml_files{1});
    else % numel(xml_files == 2)
    [xml_path, filename] = fileparts(xml_files{2});
    if ~isempty(strfind(fileread(xml_files{2}), '<Modality>CXR</Modality>')) 
         [xml_path, filename] = fileparts(xml_files{1}); % switch if xml_files{2} is the CXR for some reason
    end 
end 

 
% get z_min->z_index, slice_thickness, and voxel_spacing from dicoms (REWORKED for speed)

dcm_files = find_files(xml_path, '.dcm');

if(numel(dcm_files) > 0) % initialize first z_index value so you don't have to resize array 
 	dicomInformation = dicominfo(dcm_files{1});
    z = dicomInformation.SliceLocation;
end

z_index = z*ones(1,numel(dcm_files)); % set as a vector where every value is the first value repeated

for j = 2:numel(dcm_files) % takes forever
 	dicomInformation = dicominfo(dcm_files{j});
    z_index(j) = dicomInformation.SliceLocation;
end

slice_thickness = dicomInformation.SliceThickness;
%voxel_spacing = [dicomInformation.PixelSpacing(1), dicomInformation.PixelSpacing(1), slice_thickness];
z_min = min(abs(z_index));

if(isempty(strfind(filename, '.xml'))) %happens inexplicably
    filename = [filename '.xml']; 
end; 

% get some more parameters from LIDC_characteristics_bounding
[bounding_box_annotator, ~, ~, nodule_names_annotator] = ...
    LIDC_characteristics_boundingNOSAVE(xml_path, filename, z_min, slice_thickness); % takes a long time too

for i = 1:numel(bounding_box_annotator) % for each annotator i
    for j=1:numel(bounding_box_annotator{i}) % for each nodule j
        corners=bounding_box_annotator{i}{j};
        x = mean(corners(1:2));
        y = mean(corners(3:4));
        z = mean(corners(5:6));
        nod_name = nodule_names_annotator{i}{j};
        output = [pat_dicomdir '-annotator-' int2str(i) '-' nod_name]; 
        fprintf(fout, '%s %3.1f %3.1f %3.1f \n', output, x, y, z);
        %dlmwrite('E:\3DLIDC_project_E\LIDC_subset_known_diagnosis\nodule_matching.csv', [output x y z]);
    end
end

end % end function