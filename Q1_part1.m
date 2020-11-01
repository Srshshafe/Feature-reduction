%%         Feature Selection for Both Data Sets
%  Sequential Forward Selection  strategy and sum of 
%  Squared Euclidean Distances for dataset A
%% 
clc
clear all
close all
Data_A = xlsread('a1.xlt');
[row,col] = size(Data_A);
C1 = [];
C2 = [];
C3 = [];
% Seperating our classes so  later on we can use them easier
% We get 59 samples for C1, 71 samples for C2, 48 samples for C3;
% Each class contains 13 feautures:
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
feature = [];
index = [];
temp = 0;
ind = 0;
% Selecting our features;TAKES TIME!(You may use the Published version)
% We selesct first 6 features that has more distance from others..
% These features are aslo recognized as most important;
for w = 1:6
    for q = 1:13
        for i = 1:row1
            for j=1:row2
                for k=1:row3 
               f1 = dist(C1(i,q),C2(j,q));
               f2 = dist(C2(j,q),C3(k,q));
               f3 = dist(C1(i,q),C3(k,q));
               temp =temp+f1+f2+f3;
                end
            end
        end
    feature(q) = temp;
    temp = 0;
    end
if(ind(1) ~= 0)
    for t = 1:length(index)
        feature(index(t)) = 0;
    end
end
ind= find(max(feature)==feature);
index(w)=ind(1)
end