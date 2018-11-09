function noteMatrix = getNotes(fMatrix,bpm)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
noteValues=cell(length(fMatrix));
for i=1:length(fMatrix);
    noteValues{i}=getNoteValue(fMatrix(i));
end
noteLengths=collapseNotes(noteValues);
noteMatrix=assignMeter(noteLengths,bpm);
end

