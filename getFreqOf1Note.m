function y = getFreqOf1Note(m,timeLen,mLen)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
l=abs(fft(m));
k=0;
freq=0;
for i=1:mLen
    if k<l(1,i)
        k=l(1,i);
        freq=(i-1)/timeLen;
    end
end
y=freq;
end

