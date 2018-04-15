
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONE:
% reslice 
% bounding box need to be square
% generate postive and negative images.
% train a cnn model
% no need of the perl program.
%
% TO DO:
% -------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clc
% clear

% this software comes with no warranty lol 

%addpath('C:\Users\Mingchen\Dropbox\matlab\toolboxes\NIfTI_20140122');
%addpath('C:\MATLAB\toolboxes\NIfTI_20140122');
addpath('./Matlab_toolkits/LIDCtoolbox_mingchen_for_Mario');
addpath('./Matlab_toolkits/Nifti_toolbox');
addpath('./Matlab_toolkits/Misc_tookbox');


LIDC_path = 'O:/DMprj/MarioProjects/HDOVRFLOW/';
%mkdir([LIDC_path '\reslice\']);
% Used if no images are found (i.e. you have only downloaded the XML files)
%default_pixel_spacing = 0.787109; 

% Turns off image missing warnings if using the XML only download
% no_image_file_missing_warnings = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LIDC_path = correct_path(LIDC_path);

if ~isempty(strfind(LIDC_path, ' '))
    error('The LIDC path cannot contain spaces.');
end

xml_files = find_files(LIDC_path, '.xml', 'max');
new_xml_paths = cell(1, numel(xml_files)); % Keep a record of the paths that have been processed 
for xml_num = 1:numel(xml_files)                 % so that they can be cleaned up if something goes wrong
    
    [xml_path, filename] = fileparts(xml_files{xml_num});
    filename = [filename '.xml'];
    xml_path = correct_path(xml_path);
   

    % Extract the individual annotations from the xml files
    pos = strfind(xml_path, 'LIDC-IDRI-');
    patient_number = xml_path(pos:pos+13);
    [annotator_count, studyID] = count_annotator(xml_path, filename);
    
    
    if annotator_count > 0
        try
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Get the dicom information from the first DICOM file found
            % in the XML directory 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            image_exist = 0;
            dcm_files = find_files(xml_path, '.dcm');
            for j = 1:numel(dcm_files)
                dicomInformation = dicominfo(dcm_files{j});
                % Make sure that the StudyInstanceUID matches that found in
                % the XML annotations
                if strcmpi(strrep(dicomInformation.StudyInstanceUID, '1.3.6.1.4.1.14519.5.2.1.6279.6001.', ''), studyID) && image_exist == 0
                    image_exist = 1;
                    break                    
                end
            end
                        
            if (image_exist == 1 && isfield(dicomInformation,'PixelSpacing'))
                %z_index = [];
                    if(numel(dcm_files) > 0) % initialize first z_index value so you don't have to resize array 
                        dicomInformation = dicominfo(dcm_files{1});
                        z = dicomInformation.SliceLocation;
                    end
                    z_index = z*ones(1,numel(dcm_files));
                % end z_index correction pt 1
                slice_thickness = dicomInformation.SliceThickness;
                disp(xml_path);
                disp(slice_thickness);
                voxel_spacing = [dicomInformation.PixelSpacing(1), dicomInformation.PixelSpacing(1), slice_thickness];
                image = zeros(dicomInformation.Height, dicomInformation.Width, numel(dcm_files));
                
                for j = 1:numel(dcm_files)
                    dicomInformation = dicominfo(dcm_files{j});
                    %z_index = [z_index dicomInformation.SliceLocation];
                        z_index(j) = dicomInformation.SliceLocation; % z_index correction pt 2
                    image(:,:,dicomInformation.InstanceNumber) = dicomread(dcm_files{j});
                end
                                
                % save image nii
                image_nii = make_nii(image, voxel_spacing);
                pos = strfind(xml_path, 'LIDC-IDRI-');
                save_nii(image_nii, [xml_path(1:pos+13),'.hdr']); 
                
                z_min = min(abs(z_index));
            else
                z_min = 37.75;
                slice_thickness = 2.5;
                warning(['No image found (looking in ' xml_path]);
            end

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % extract 
            % - characteristics
            % - bounding box
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [bounding_box_annotator, characteristics_annotator, roi_annotator, nodule_names_annotator] = ...
                LIDC_characteristics_bounding(xml_path, filename, z_min, slice_thickness);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % save the images to nii           
            % - binary for each annotator
            % - ROI for each annotator, each nodule
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if ~isempty(characteristics_annotator{1})
                LIDC_nii_each_annotator(xml_path, roi_annotator, bounding_box_annotator, nodule_names_annotator, image, voxel_spacing);               
            else
                warning('No characteristics: not processing');
            end
            
        catch e

            rethrow(e);
        end
    end
    
end