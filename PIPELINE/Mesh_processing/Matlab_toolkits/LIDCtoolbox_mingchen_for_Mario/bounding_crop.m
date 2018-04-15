function cropped_image = bounding_crop( bounding_box, mask, margin, voxel_spacing, default_size )

if ~exist('margin', 'var')
    margin = 0;
end


x_min = bounding_box(1) - margin;
x_max = bounding_box(2) + margin;
y_min = bounding_box(3) - margin;
y_max = bounding_box(4) + margin;
z_min = bounding_box(5) - margin;
z_max = bounding_box(6) + margin;


crop_size = [(x_max - x_min), (y_max - y_min), (z_max - z_min)] + 1;
extend_size = ceil(((default_size./voxel_spacing) - crop_size)./2);

x_max_extend = x_max + extend_size(1);
x_min_extend = x_min - extend_size(1);
y_max_extend = y_max + extend_size(2);
y_min_extend = y_min - extend_size(2);
z_max_extend = z_max + extend_size(3);
z_min_extend = z_min - extend_size(3);


if (x_min_extend > 0 & y_min_extend > 0 & z_min_extend > 0 & y_max_extend < size(mask,1) & x_max_extend < size(mask,2) & z_max_extend < size(mask,3))
    cropped_image = mask(y_min_extend:y_max_extend, x_min_extend:x_max_extend, z_min_extend:z_max_extend);
else
    cropped_image = [];
end
end
