function noteValue = recordNoteAndGetValue()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs=8000;
length=1;
recObj=audiorecorder;
disp('Start playing');
recordblocking(recObj,length);
disp('Stop playing');
play(recObj);
myRec=getaudiodata(recObj)';
freq=getPerciseFrequency(myRec,length,length*Fs);
noteValue=get1NoteValue(freq);
end

