function m = recSongAndGetFreq( recLen )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
length=0.015;
iterTimes=round(recLen/length);
recResolution=round(length*8000);
recObj=audiorecorder;
plotMatrix=zeros(1,recResolution,iterTimes);
disp('Start playing')
for i=1:iterTimes
    recordblocking(recObj,length);
    plotMatrix(:,:,i)=getaudiodata(recObj)';
end
disp('Stop playing')
freqMatrix=1:iterTimes;
plot(abs(fft(plotMatrix(:,:,10))));
for i=1:iterTimes
    rec=plotMatrix(:,:,i);
    freq=getPerciseFrequency(rec,length,recResolution);
    freqMatrix(1,i)=freq;
end
m=freqMatrix;
end

