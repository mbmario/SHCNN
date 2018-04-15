linear = imread('0002-1-Nodule_001-ROI_combined_rgb_linear.bmp');
x = imread('/media/mario/DATAPART1/LIDC_bmp_slices_dir/0002-1-Nodule_001-ROI_fixed_x.bmp');
nonlinear = imread('/media/mario/DATAPART1/LIDC_bmp_combined_dir/0002-1-Nodule_001-ROI_combined_rgb_s.bmp');

x - linear(:,:,1)
x - nonlinear(:,:,1)