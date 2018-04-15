function [ combined_image ] = combined_binary( rad_cell )
%assumes binary input

combined_image = rad_cell{1};

for m = 2:size(rad_cell,2)
    combined_image = combined_image + rad_cell{m};
end

combined_image(combined_image>0) = 1;

end

