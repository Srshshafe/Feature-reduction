%% feature selection
% Using Sequential Backward Selection(SBS) for dataset A
clc
clear all
Data_A = xlsread('a1.xlt');
[row,col] = size(Data_A);
C1 = [];
C2 = [];
C3 = [];
% Seperating our classes..
for i =1:row
    if Data_A(i,1)==1
        C1 = [C1;Data_A(i,2:end)];
    elseif Data_A(i,1)==2
        C2 = [C2;Data_A(i,2:end)];    
    else 
        C3 = [C3;Data_A(i,2:end)];
    end
end
[row1,col1] = size(C1);
[row2,col2] = size(C2);
[row3,col3] = size(C3);
feature=[];
index =[];
temp = 0;
ind =0;
% Selecting our features using (SBS);
for w = 1:8
for q = 1:13
    for i = 1:row1
       for j = 1:row2 
           for k = 1:row3 
               f1 = dist(C1(i,q),C2(j,q));
               f2 = dist(C2(j,q),C3(k,q));
               f3 = dist(C1(i,q),C3(k,q));
               temp = temp+f1+f2+f3;
           end
       end
    end
    feature(q) = temp;
    temp = 0;
end
if(ind(1)~=0)
    for t = 1:length(index)
        feature(index(t)) = inf;
    end
end
ind= find(min(feature)==feature);
index(w)=ind(1)
end
index
disp('These 10 features must be filtered/deleted from list of features')
