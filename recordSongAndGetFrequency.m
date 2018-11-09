function noteMatrix = recordSongAndGetFrequency( lengthSeconds, bpm )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Fs=8000;
bitLength=round(0.015*Fs);
recObj=audiorecorder;
disp('start playing');
recordblocking(recObj,lengthSeconds);
disp('stop playing');
recAudio=getaudiodata(recObj)';
iterTimes=floor(lengthSeconds/0.015);
fMatrix=zeros(iterTimes);
for i=1:iterTimes
    mat=zeros(1,bitLength);
    startInd=(i-1)*bitLength;
    for j=1:bitLength
        mat(1,j)=recAudio(1,startInd+j);
    end
    fMatrix(i)=getFreqOf1Note(mat,0.015,bitLength);
end
display(fMatrix(1))
display(fMatrix(5))
noteMatrix=getNotes(fMatrix,bpm);
end

