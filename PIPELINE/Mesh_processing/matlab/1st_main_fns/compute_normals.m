function [] = compute_normals(INDIR, OUTDIR) 
cd(INDIR);
files = dir('*.off');
for file = files' 
   disp(['computing normals of ' file.name, '...']);   
   [~, name, ~] = fileparts(file.name);
   [vertex face] = read_off(file.name);   % saves off files to off subdirectory
   [normal,~] = compute_normal(vertex,face); % normal = vertex normals, normalf = face normals (don't need)
   normal = normal';
   dlmwrite([OUTDIR '/' name, '_normal.txt'], normal);
   if (strcmp(INDIR, OUTDIR) ~= 1) % if they're going to different directories, copy the 
        copyfile(file.name, OUTDIR);  
   end
   disp('saved');
end
end
