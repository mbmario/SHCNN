function [ subtracted_image ] = subtractive_binary( rad_cell )
%assumes binary input

% cell_length = 1;
% n  = 1;
% while ~isempty(rad_cell{n})
%     cell_length = cell_length + 1;
%     n = n+1;
% end
% cell_length = cell_length - 1;
% 
% rad1 = rad_cell{1};
% 
% %dimensions
% image_length = length(rad1(:,1,1));
% image_width = length(rad1(1,:,1));
% image_height = length(rad1(1,1,:));

subtracted_image = ones(size(rad_cell{1}));

for m = 1:size(rad_cell,2)
    subtracted_image = subtracted_image .* rad_cell{m};
end

end
