function [bounding_box_annotator,characteristics_annotator, roi_annotator, nodule_names] = LIDC_characteristics_bounding(xml_path, filename, z_min, slice_thickness)

xml_path = correct_path(xml_path);

try
    docNode = xmlread([xml_path filesep filename]);
catch e
    error('Failed to read XML file %s.',filename);
    return
end


document = docNode.getDocumentElement;
reading_sessions = document.getChildNodes;

pos = strfind(xml_path, 'LIDC-IDRI-');

% Count the number of annotator in the XML file
c1 = 0;

characteristics_tag = {'subtlety', 'internalStructure', 'calcification', 'sphericity', 'margin', 'lobulation', 'spiculation', 'texture', 'malignancy'};
annotator = 0;
while ~isempty(reading_sessions.item(c1))
%     display('c1: ');
%     display(reading_sessions.item(c1).getNodeName);
    
    if strcmpi(reading_sessions.item(c1).getNodeName, 'readingSession')
        c1_sub = 0;
        annotator = annotator + 1;
        nodel_num = 0;
        
        while ~isempty(reading_sessions.item(c1).item(c1_sub))
%             display('c1_sub: ');
%             display(reading_sessions.item(c1).item(c1_sub).getNodeName);
            
            if strcmpi(reading_sessions.item(c1).item(c1_sub).getNodeName, 'unblindedReadNodule')
                c1_sub2 = 0;
                x_all = [];
                y_all = [];
                z_all = [];
                roi_num =1;
                characteristics_exist = 0;
                
                while ~isempty(reading_sessions.item(c1).item(c1_sub).item(c1_sub2))
%                     display('c1_sub2: ')
%                     display(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).getNodeName)
                    
                    switch char(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).getNodeName)
                        case 'noduleID'
                            nodeID = char(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).getTextContent);
                            
                        case 'characteristics'
                            c1_sub3 = 0;
                            characteristics_array = zeros(size(characteristics_tag));
                            
                            while ~isempty(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).item(c1_sub3))
%                                 display('c1_sub3: ');
%                                 display(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).item(c1_sub3).getNodeName);
                                
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                % read the characteristics and put it to
                                % the correct postion at the array
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                characteristics = char(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).item(c1_sub3).getNodeName);
                                characteristics_pos = find(strcmp(characteristics, characteristics_tag), 1);
                                if ((~isempty(characteristics_pos)) && (characteristics_pos > 0) && (characteristics_pos < size(characteristics_tag,2)+1))
                                    characteristics_array(characteristics_pos) = str2double(reading_sessions.item(c1).item(c1_sub).item(c1_sub2).item(c1_sub3).getTextContent);
                                end
                                
                                c1_sub3 = c1_sub3 + 1;
                            end
                            if ~isempty(characteristics_array)
                                characteristics_exist = 1;
                                nodel_num = nodel_num + 1;
                            end
                        case 'roi'
                            if characteristics_exist == 1
                                c1_sub4 = 0;
                                roi = reading_sessions.item(c1).item(c1_sub).item(c1_sub2).getChildNodes;
                                while ~isempty(roi.item(c1_sub4))
                                    if strcmpi(roi.item(c1_sub4).getNodeName, 'imageZposition')
                                        z = (abs(str2double(roi.item(c1_sub4).getTextContent))-z_min)./slice_thickness + 1;
                                        %z = (abs(str2double(roi.item(c1_sub4).getTextContent)));
                                        z_all = [z_all z];
                                    end
                                    if strcmpi(roi.item(c1_sub4).getNodeName, 'edgeMap')
                                        c1_sub5 = 0;
                                        xy = roi.item(c1_sub4).getChildNodes;
                                        while ~isempty(xy.item(c1_sub5))
                                            if strcmpi(xy.item(c1_sub5).getNodeName, 'xCoord')
                                                x_all = [x_all str2double(xy.item(c1_sub5).getTextContent)];
                                            end
                                            if strcmpi(xy.item(c1_sub5).getNodeName, 'yCoord')
                                                y_all = [y_all str2double(xy.item(c1_sub5).getTextContent)];
                                                roi_all(roi_num,:) = [x_all(end), y_all(end), z_all(end)];
                                                roi_num = roi_num+1;
                                            end
                                            c1_sub5 = c1_sub5 + 1;
                                        end
                                    end
                                    c1_sub4 = c1_sub4 + 1;
                                end
                            end
                    end % switch reading_sessions.item(c1).item(c1_sub).item(c1_sub2).getNodeName
                    c1_sub2 = c1_sub2 + 1;
                end
                
                if characteristics_exist == 1

                    bounding_box(1) = min(x_all) + 1;
                    bounding_box(2) = max(x_all) - 1;
                    bounding_box(3) = min(y_all) + 1;
                    bounding_box(4) = max(y_all) - 1;
                    bounding_box(5) = min(z_all);
                    bounding_box(6) = max(z_all);
                    
                    characteristics_annotator{annotator}{nodel_num} = characteristics_array;            
                    bounding_box_annotator{annotator}{nodel_num} = bounding_box;
                    roi_annotator{annotator}{nodel_num} = roi_all;                    
                    nodule_names{annotator}{nodel_num} = nodeID;
                    
                    % write mat files
%                     box_name = [xml_path(1:pos+13),'-bb-annotator-',num2str(annotator),'-',nodeID,'.mat'];
%                     save(box_name, 'bounding_box');
%                     roi_name = [xml_path(1:pos+13),'-roi-annotator-',num2str(annotator),'-',nodeID,'.mat'];
%                     save(roi_name, 'roi_all');
                    char_name = [xml_path(1:pos+13), '-char-annotator-',num2str(annotator),'-',nodeID,'.mat'];
                    save(char_name,'characteristics_array');
    
                end 
            end
            c1_sub = c1_sub + 1;
        end
    end
    c1 = c1 + 1;
end
if exist('characteristics_annotator') == 0
    characteristics_annotator = cell(1,1);
    bounding_box_annotator = cell(1,1);
    roi_annotator = cell(1,1);
    nodule_names = cell(1,1);
    display('There are no characteristics.\n');

    filename = [xml_path(1:pos+13),'_char_dont_exist.txt'];
    fileID = fopen(filename, 'w');
    fprintf(fileID,'%s','');
    fclose(fileID);   
end

