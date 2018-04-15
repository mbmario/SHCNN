function image = boundary_2_binary(image, binary_location_boundary)

[z_location, ~,ic] = unique(binary_location_boundary(:,3));
for i = 1:size(z_location)
    image(:,:,z_location(i)) = poly2mask( binary_location_boundary(ic==i,1),...
        binary_location_boundary(ic==i,2),size(image,1),size(image,2));
end

end