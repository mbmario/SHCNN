function [] = analyze_to_off(INDIR, OUTDIR) 
    cd(INDIR)
    files=dir('*.hdr');
    for file = files' 
        disp(strcat(file.name, '...'));
        [~, name, ~] = fileparts(file.name);
   
        % changed: nii2mesh (commented out save); write_off added, faces
        % rearranged
        [vertex, face] = nii2mesh(load_nii(file.name), strcat('./off/' ,name, '.off'), 0.5); % SAVE COMMENTED OUT
        face = face(:,[3 2 1]); %#ok<*NASGU> % flips normals
        write_off([OUTDIR '/' name '.off'], vertex, face);
        disp('saved');
    end
    disp('offs complete'); disp(' ');
end