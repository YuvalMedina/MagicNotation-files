function freq = getPerciseFrequency(m,timeLen,mLen)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
l=abs(fft(m));
y=0;
x=0;
for i=1:mLen
    if y<l(1,i)
        y=l(1,i);
        x=i-1;
    end
end
solution=0;
if x>0 & x<mLen
    point1=[x-1 l(x-1)];
    point2=[x y];
    point3=[x+1 l(x+1)];
    syms A B C;
    eq1=A*point1(1)^2+B*point1(1)+C==point1(2);
    eq2=A*point2(1)^2+B*point2(1)+C==point2(2);
    eq3=A*point3(1)^2+B*point3(1)+C==point3(2);
    [a,b,c]=solve(eq1,eq2,eq3);
    syms X;
    solution=solve(a*2*X+b==0,X)/timeLen;
else
    solution=0;
end
freq=solution;
end

