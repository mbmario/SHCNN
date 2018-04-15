function LIDC_nii_each_annotator(xml_path, roi_annotator, bounding_box_annotator, nodule_names_annotator, image, voxel_spacing)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% convert the annotation to nii image for every annotator.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mario changes
% 1) added if around 
%   binary_array{annotator} = combined_binary(binary_each_annotator)...
% 2) added if around inner roi-annotator for loop
% 3) flag replaced isempty(binary_array)
% 4) flag added to 1) "if" to test for mismatched binary_each_annotator array sizes
xml_path = correct_path(xml_path);

binary_array = [];
%mask_array = [];
bea_flag = 0; % added; bumped up scope to be used w/ 2nd flag

for annotator = 1:numel(roi_annotator)
    binary_each_annotator = [];
    size1 = 0;  % added
    for nodule = 1:numel(roi_annotator{annotator})
        binary_each_annotator{nodule} = boundary_2_binary(zeros(size(image)), roi_annotator{annotator}{nodule});
        size_vector = size(binary_each_annotator{nodule}); % begin added segment; have to do this line separately
        if (nodule == 1) 
            size1 = size_vector(1,3);
        else
            if (size_vector(1,3) ~= size1) 
                bea_flag = 1; % TRIGGERED
                disp('binary_each_annotator nodule-specific size mismatch');
            end
        end % end added segment
    end % end nodule for loop  
    pos = strfind(xml_path, 'LIDC-IDRI-');
    if ((numel(roi_annotator{annotator}) ~= 0) && ~bea_flag) % added; if roi_annotator exists and bea is not mismatched
        binary_array{annotator} = combined_binary(binary_each_annotator); % usually when there's trouble, it's here
        Binary_nii = make_nii(uint8(binary_array{annotator}),voxel_spacing);
        save_nii(Binary_nii, [xml_path(1:pos+13),'-binary-annotator-',num2str(annotator),'.hdr']);
    end 
    %         mask_fullsize = image .* binary_fullsize;
    %         mask_array{i} = mask_fullsize;
    %         Mask_nii = make_nii(mask_fullsize,[dicomInformation.PixelSpacing(1), dicomInformation.PixelSpacing(2), dicomInformation.SliceThickness]);
    %         save_nii(Mask_nii, [xml_path(1:pos+13),'-mask-annotation-',num2str(i),'.hdr']);
end
default_spacing = [1,1,1];
default_size = [25,25,25];

for annotator = 1:numel(bounding_box_annotator)
    if (numel(bounding_box_annotator{annotator}) ~= 0)
    for nodule = 1:numel(bounding_box_annotator{annotator})        
        cropped_ROI = bounding_crop(bounding_box_annotator{annotator}{nodule}, image,1, voxel_spacing, default_size);
        %cropped_binary = bounding_crop(bounding_box, binary_fullsize);
        if ~isempty(cropped_ROI)
            nodule_name_index = nodule_names_annotator{annotator}{nodule};
            cropped_ROI_nii = make_nii(cropped_ROI,voxel_spacing);
            cropped_ROI_name = [xml_path(1:pos+13),'-ROI-annotator-',num2str(annotator),'-',nodule_name_index,'.hdr'];
            %cropped_ROI_reslice_name = [xml_path(1:pos-1),'reslice\',xml_path(pos:pos+13),'-ROI-annotator-',num2str(annotator),'-',nodule_name_index,'_reslice.hdr'];
            save_nii(cropped_ROI_nii, cropped_ROI_name);
           % reslice_nii_dimensions(cropped_ROI_name, cropped_ROI_reslice_name, default_spacing, 1, 0, 1, [], 's', default_size);
            
            
            %                 cropped_binary_nii = make_nii(uint8(cropped_binary),voxel_spacing);
            %                 save_nii(cropped_binary_nii, [xml_path(1:pos+13),'-binary-annotator-',num2str(i),'-',bounding_array{i}{l}(nodule_name_index:(length(bounding_array{i}{l})-4)),'.hdr']);
            %                 mask_stats = mean_SD_vol_pathology(cropped_ROI, dicomInformation.PixelSpacing(1)*dicomInformation.PixelSpacing(2)*dicomInformation.SliceThickness);
            %                 bounding_file_index = strfind(bounding_array{i}{l},'bb') - 1;
            %                 save([bounding_array{i}{l}(1:bounding_file_index),'LIDC-IDRI-',xml_path(pos+10:pos+13),'-mask-stats-',num2str(i),'-',bounding_array{i}{l}(nodule_name_index:(length(bounding_array{i}{l})-4)),'.mat'],'mask_stats');                             end
        end
    end % end inner for
    end % end if (numel(bounding...))
end



size2=0; flag = 1; % flag: is every entry in binary_array nonempty?
for i = 1:numel(binary_array)   
    if (numel(binary_array{i}) == 0) 
        flag = 0;
        break;
    end
   	size_vector = size(binary_array{i});
    if (i==1)
        size2 = size_vector(1,3);
    elseif (size2 == size_vector(1,3))
            flag = 0;
    end 
end

% does binary-intersect and combined stuff
if (flag == 1 && bea_flag==0) %if ~isempty(binary_array)
    binary_combined = combined_binary(binary_array);
    Binary_nii_combined = make_nii(uint8(binary_combined),voxel_spacing);
    pos = strfind(xml_path, 'LIDC-IDRI-');
    save_nii(Binary_nii_combined, [xml_path(1:pos+13),'-binary-combined','.hdr']);
    
    binary_intersect = subtractive_binary(binary_array);
    Binary_nii_intersect = make_nii(uint8(binary_intersect), voxel_spacing);
    pos = strfind(xml_path, 'LIDC-IDRI-');
    save_nii(Binary_nii_intersect, [xml_path(1:pos+13),'-binary-intersect','.hdr']);
    
    %         mask_combined = binary_combined .* image;
    %         Mask_nii_combined = make_nii(uint8(mask_combined),spacing);
    %         pos = strfind(xml_path, 'LIDC-IDRI-');
    %         save_nii(Mask_nii_combined, [xml_path(1:pos+13),'-combined-binary','.hdr']);
    %
    %         mask_intersect = binary_intersect .* image;
    %         Mask_nii_intersect = make_nii(uint8(mask_intersect), spacing);
    %         pos = strfind(xml_path, 'LIDC-IDRI-');
    %         save_nii(Mask_nii_intersect, [xml_path(1:pos+13),'-intersect-binary','.hdr']);
end


%     binary_graded_combined = combined_graded_binary(mask_array);
%     Mask_nii_graded_combined = make_nii(uint8(binary_graded_combined), spacing);
%     pos = strfind(image_path, 'LIDC-IDRI-');
%     save_nii(Mask_nii_graded_combined, [image_path(1:pos-1),'LIDC-IDRI-',image_path(pos+10:pos+13),'graded_binary','.hdr']);

end