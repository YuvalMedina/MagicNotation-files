function frequencyMatrix = recordSongAndGetFreqMat( lengthSeconds )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs=8000;
n_bits=8;
n_channels=1;
recLength=0.015;
iterTimes=round(lengthSeconds/recLength);
recResolution=round(recLength*Fs);
recObj=audiorecorder(Fs,n_bits,n_channels);
plotMatrix=zeros(1,recResolution,iterTimes);
%set(recObj,'TimerFcn',{@recordFragments,recObj,iterTimes,recLength,plotMatrix});
%set(recObj,'TimerPeriod',0.015);
disp('Start playing');
record(recObj);
timer=tic;
for i=1:iterTimes
    while toc(timer)<0.010
    end
    stop(recObj);
    toc(timer)
    j=getaudiodata(recObj)';
    record(recObj);
    plotMatrix(:,:,i)=j;
end
fMatrix=zeros(1,iterTimes);
plot(abs(fft(plotMatrix(:,:,10))));
for i=1:iterTimes
    rec1=plotMatrix(:,:,i);
    fMatrix(1,i)=getPerciseFrequency(rec1,lengthSeconds,recResolution);
end
frequencyMatrix=fMatrix;
end

function recordFragments(recObj,counter,recLength,plotMatrix)
if counter>0
    stop(recObj);
    i=getaudiodata(recObj)';
    set(recObj,'TimerFcn',{@recordFragments,recObj,counter-1,recLength,plotMatrix});
    set(recObj,'TimerPeriod',0.015);
    record(recObj);
    plotMatrix(:,:,counter)=i;
else
    stop(recObj);
    plotMatrix(:,:,counter)=getaudiodata(recObj)';
    disp('Stop playing');
end
end