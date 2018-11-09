function freqM = recordAndGetFreq(length)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Fs=8000;
res=0.015;
bitLength=res*Fs;
recObj=audiorecorder;
disp('Start playing')
recordblocking(recObj,length);
disp('Stop playing');
play(recObj);
myRec=getaudiodata(recObj)';
iterTimes=floor(length/res);
fMatrix=zeros(iterTimes);
for i=1:iterTimes
    mat=zeros(1,bitLength);
    startInd=(i-1)*bitLength;
    for j=1:bitLength
        mat(1,j)=myRec(1,startInd+j);
    end
    fMatrix(i)=getFreqOf1Note(mat,res,bitLength);
end
freqM=fMatrix;
end

