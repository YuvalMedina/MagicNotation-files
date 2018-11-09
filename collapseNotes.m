function collapsed = collapseNotes( notes )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
time=0.015;
mat=cell(length(notes),2);
mat{1,1}=notes{1};
mat{1,2}=time;
for i=2:length(notes)
    str1=strcat(notes{i,1});
    str2=strcat(notes{i-1,1});
    if (i==2)
        display(str1)
        display(str2)
    end
    if(str1==str2)
        mat{i,2}=mat{i,2}+time;
    else
        mat{i,1}=notes{i};
        mat{i,2}=time;
    end
end
collapsed=mat;
end

