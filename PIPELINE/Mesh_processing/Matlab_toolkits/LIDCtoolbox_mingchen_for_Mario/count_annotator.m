function [annotator_count, studyID] = count_annotator(xml_path, filename)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LIDC Toolbox
%
% If you use the software for research purposes I kindly ask you to cite
% the following paper:
%
%    T. Lampert, A. Stumpf, and P. Gancarski, 'An Empirical Study of Expert 
%       Agreement and Ground Truth Estimation', (submitted).
%
%
% The annotations from each annotator within the LIDC database are 
% contained within the same XML file. This function splits the annotations
% for each expert into different XML files allowing the GTs to be
% reconstructed using LIDC_xml_2_pmap. (If they were all in the same file 
% then LIDC_xml_2_pmap creates probability maps in which the individual 
% markings cannot be discerned.)
%
%
%   Thomas Lampert, http://sites.google.com/site/tomalampert
%  
%   Copyright 2013
%
%
%   This is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   This software is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this software. If not, see <http://www.gnu.org/licenses/>.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xml_path = correct_path(xml_path);

try
    docNode = xmlread([xml_path filesep filename]);
catch e
    error('Failed to read XML file %s.',filename);
    return
end



document = docNode.getDocumentElement;
reading_sessions = document.getChildNodes;


% Count the number of readers in the XML file
c1 = 0;
annotator_count = 0;
while ~isempty(reading_sessions.item(c1))
    
    if strcmpi(reading_sessions.item(c1).getNodeName, 'ResponseHeader')
        
        studyID = getStudyInstanceUID(reading_sessions.item(c1));
        
    end
    
    if strcmpi(reading_sessions.item(c1).getNodeName, 'readingSession')
        
        reading_session{annotator_count+1} = reading_sessions.item(c1);
        
        annotator_count = annotator_count + 1;
        
    end
    c1 = c1 + 1;
end



end

function studyID = getStudyInstanceUID(responseHeaderNode)

    contentNodes = responseHeaderNode.getChildNodes;
    
    c1 = 0;
    while ~isempty(contentNodes.item(c1))
        
        if strcmpi(contentNodes.item(c1).getNodeName, 'StudyInstanceUID')
            
            studyID = char(contentNodes.item(c1).getTextContent);
            
            studyID = strrep(studyID, '1.3.6.1.4.1.14519.5.2.1.6279.6001.', '');
            
        end
        
        c1 = c1 + 1;
    end

end