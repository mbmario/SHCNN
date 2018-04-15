function image = boundary_2_binary(image, binary_location_boundary)

[z_location, ~,ic] = unique(binary_location_boundary(:,3));

% % printing statements for debugging purposes
% disp('processing z_location: Is negative? ');
% disp(z_location < 0);
if (sum(z_location < 0) ~= 0) 
    disp('aborting boundary_2_binary: z_location negative');
    return;
end
% % end Mario's code

for i = 1:size(z_location)
    image(:,:,int16(z_location(i))) = poly2mask( binary_location_boundary(ic==i,1),...
        binary_location_boundary(ic==i,2),size(image,1),size(image,2));
end

end