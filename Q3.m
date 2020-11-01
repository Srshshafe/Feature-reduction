%% feature selection
% wrapper based feature selection with (SFS) search strategy 
% for dataset A
clc
clear all
Data_A = xlsread('a1.xlt');
[row,col] = size(Data_A);
C1 = [];
C2 = [];
C3 = [];
for i =1:row
    if Data_A(i,1)==1
        C1 = [C1;Data_A(i,:)];
    elseif Data_A(i,1)==2
        C2 = [C2;Data_A(i,:)];    
    else 
        C3 = [C3;Data_A(i,:)];
    end
end
[row1,col1] = size(C1);
[row2,col2] = size(C2);
[row3,col3] = size(C3);
feature=[];
index =[];
temp = 0;
ind =0;
M1 = mean(C1(:,:));
S1 = cov(C1(:,:));
M2 = mean(C2);
S2 = cov(C2);
M3 = mean(C3);
S3 = cov(C3);
Data = [C1;C2;C3];
[row1,col1] = size(Data);
l = 2:col1;
acc1=[];
for  n=1:2
        p =2:col1;
        for j=1:length(index)
                p(index(j))=[];
        end
        l = p;
        for w = p
                Y = [];
                for i = 1:row1
                    D1 = dist(Data(i,l),M1(:,l));
                    D2 = dist(Data(i,l),M2(:,l));
                    D3 = dist(Data(i,l),M3(:,l));
                    T = [D1,D2,D3];
                    Y(i) = ind(1);
                end
                Y = Y';
                acc1=[acc1,length(find((abs(Y-Data(:,1)))==0))/row1];
                for u = 1:length(w:length(p))
                    l(u)= [w+u];
                end
        end
        ind= find(max(acc1)==acc1);
        index(n)=ind(1);
        index
end
disp('These features must be filtered/deleted from list of features')
