function v = record(length)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
recObj=audiorecorder;
disp('Start')
recordblocking(recObj,length);
disp('end');
play(recObj);
myRecording=getaudiodata(recObj);
v=myRecording';
end

