function [newVertices, faces] = nii2mesh(nii, filename, threshold)
% Given a nii, get the mesh file in off format.
% filename = 'C:\Users\Mingchen\Dropbox\TopoFixing\persistence\heartbin\normal_70_cropped_tra_seg_270';
% threshold = 0.8;

if(nargin == 1)
    filename = 'test.off';
    threshold = 0.5;
end

if(nargin == 2)
    threshold = 0.5;
end

ElementSpacing = nii.hdr.dime.pixdim(2:4);

%offset = -nii.hdr.hist.originator(1:3);
offset = [0 0 0];
image = nii.img;
image = (image - min(image(:)))/(max(image(:)) - min(image(:)));
[faces,vertices] = isosurface(image,threshold); 


mtx =[ElementSpacing(1) 0 0 offset(1);
    0 ElementSpacing(2) 0 offset(2);
    0 0 ElementSpacing(3) offset(3);
    0 0 0 1];

nV = [(vertices(:,1)-1),(vertices(:,2)-1),(vertices(:,3)-1), ones(size(vertices,1),1)];
newVertices = mtx*nV';
newVertices = [newVertices(1,:); newVertices(2,:); newVertices(3,:)];

%write_mesh(filename,newVertices,faces );

    
