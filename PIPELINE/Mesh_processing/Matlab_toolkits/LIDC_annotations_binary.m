function [] = LIDC_annotations_binary(BAFH, dicomdir) 
% child to chop_annotators_script

% BAFH: Binary Analyze File Hdr
% dicomdir: dir of original LIDC-IDRI-XXXX files with DICOMs/XMLs

% LIDC_annotations_binary

% chops binary segmentations into "ROI"s for each nodule

%  BAFH = ('E:\LIDC_Annotations\LIDC_subset3\LIDC-IDRI-0006-binary-intersect.hdr'); % in working dir
%  dicomdir  = ('E:\LIDC_Annotations\LIDC_subset3\'); 
%  
 if (isempty(strfind(BAFH, '-binary-annotator-')))   
    error('Wrong file: Must be "-binary-annotator-"');
 end
 

 
% get xml_path (contains proper xml and dicom)  
cd(dicomdir);
parent_dir = BAFH(strfind(BAFH, 'LIDC-'):strfind(BAFH, '-binary-')-1); % get file-spc dir containing all dicoms/xmls
xml_files = find_files(parent_dir, '.xml');  
if (numel(xml_files) == 1) 
    [xml_path, filename] = fileparts(xml_files{1});
elseif (numel(xml_files) ==2) 
    [xml_path, filename] = fileparts(xml_files{2});
    if ~isempty(strfind(fileread(xml_files{2}), '<Modality>CXR</Modality>')) 
        [xml_path, filename] = fileparts(xml_files{1}); % switch if xml_files{2} is the CXR for some reason
    end 
else
    disp('no xml files');
    return;
end 

% get z_min->z_index, slice_thickness, and voxel_spacing from dicoms
dcm_files = find_files(xml_path, '.dcm');

%z_index = []; 
if(numel(dcm_files) > 0) % initialize first z_index value so you don't have to resize array 
   dicomInformation = dicominfo(dcm_files{1});
   z = dicomInformation.SliceLocation;
end
   z_index = z*ones(1,numel(dcm_files));
   
for j = 1:numel(dcm_files)
 	dicomInformation = dicominfo(dcm_files{j});
    z_index(j) = dicomInformation.SliceLocation; % z_index correction pt 2    
end

slice_thickness = dicomInformation.SliceThickness;
voxel_spacing = [dicomInformation.PixelSpacing(1), dicomInformation.PixelSpacing(1), slice_thickness];
z_min = min(abs(z_index));

if(isempty(strfind(filename, '.xml'))) filename = [filename '.xml']; end; %happens inexplicably

% get some more parameters from LIDC_characteristics_bounding
[bounding_box_annotator, ~, ~, nodule_names_annotator] = ...
    LIDC_characteristics_bounding(xml_path, filename, z_min, slice_thickness);

% figure out annotator (TESTED)
pos= strfind(BAFH, '-annotator-');
annotator = str2num(BAFH(pos+11));

% loop over nodules
for nodule=1:numel(bounding_box_annotator{annotator})
    
    % load, set more params, crop binary image.img, save
    image= load_nii(BAFH); % .: hdr, fileprefix (name w/o .hdr), img, original 
    pos = strfind(xml_path, 'LIDC-IDRI-');
    default_size = [30,30,30]; % adjusts cropping window
    cropped_ROI = bounding_crop(bounding_box_annotator{annotator}{nodule}, image.img, 5, voxel_spacing, default_size);
        if ~isempty(cropped_ROI)
            nodule_name_index = nodule_names_annotator{annotator}{nodule};
            cropped_ROI_nii = make_nii(cropped_ROI,voxel_spacing);
            cropped_ROI_name = [xml_path(1:pos+13),'-BINARY-ROI-annotator-',num2str(annotator),'-',nodule_name_index,'.hdr'];
            save_nii(cropped_ROI_nii, cropped_ROI_name); 
            disp(['Image  ' BAFH ' saved']);
        end
        
end

end % end function