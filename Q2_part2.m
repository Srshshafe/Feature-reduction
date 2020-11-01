%% feature selection
% Using Sequential Backward Selection(SBS) for dataset B
clc
clear all
Data_A = xlsread('b1.xlt');
[row,col] = size(Data_A);
C1 = [];
C2 = [];
C3 = [];
C4 = [];
C5 = [];
C6 = [];
C7 = [];
C8 = [];
C9 = [];
C0 = [];
% Seperating our classes..
for i =1:row
    if Data_A(i,1)==1
        C1 = [C1;Data_A(i,2:end)];
    elseif Data_A(i,1)==2
        C2 = [C2;Data_A(i,2:end)];    
    elseif Data_A(i,1)==3 
        C3 = [C3;Data_A(i,2:end)];
    elseif Data_A(i,1)==4
        C4 = [C4;Data_A(i,2:end)];    
    elseif Data_A(i,1)==5 
        C5 = [C5;Data_A(i,2:end)];
    elseif Data_A(i,1)==6
        C6 = [C6;Data_A(i,2:end)];    
    elseif Data_A(i,1)==7 
        C7 = [C7;Data_A(i,2:end)];
    elseif Data_A(i,1)==8
        C8 = [C8;Data_A(i,2:end)];    
    elseif Data_A(i,1)==9 
        C9 = [C9;Data_A(i,2:end)];
    else
        C0 = [C0;Data_A(i,2:end)];
    end
end
[row1,col1] = size(C1);
[row2,col2] = size(C2);
[row3,col3] = size(C3);
[row4,col4] = size(C4);
[row5,col5] = size(C5);
[row6,col6] = size(C6);
[row7,col7] = size(C7);
[row8,col8] = size(C8);
[row9,col9] = size(C9);
[row0,col0] = size(C0);
feature=[];
index = [];
temp = 0;
ind = 0;
% Selecting our features using (SBS);
SHF = col1-18;
for w = 1 : SHF
for q = 1:row1
    for a = 1:row1
       for b=1:row2 
           for c=1:row3 
               for d = 1:row4
                   for e=1:row5 
                       for f=1:row6 
                           for g = 1:row7
                               for h=1:row8 
                                    for i=1:row9 
                                        for j=1:row0 
                                           temp = temp+ dist(C1(a,q),C0(j,q));
                                           temp = temp+dist(C1(a,q),C2(b,q));
                                           temp = temp+dist(C1(a,q),C3(c,q));
                                           temp = temp+dist(C1(a,q),C4(d,q));
                                           temp = temp+dist(C1(a,q),C5(e,q));
                                           temp = temp+dist(C1(a,q),C6(f,q));
                                           temp = temp+dist(C1(a,q),C7(g,q));
                                           temp = temp+ dist(C1(a,q),C8(h,q));
                                           temp = temp+ dist(C1(a,q),C9(i,q));
                                           
                                           temp = temp+ dist(C2(b,q),C0(j,q));
                                           temp = temp+ dist(C2(b,q),C3(c,q));
                                           temp = temp+ dist(C2(b,q),C4(d,q));
                                           temp = temp+ dist(C2(b,q),C5(e,q));
                                           temp = temp+ dist(C2(b,q),C6(f,q));
                                           temp = temp+ dist(C2(b,q),C7(g,q));
                                           temp = temp+ dist(C2(b,q),C8(h,q));
                                           temp = temp+ dist(C2(b,q),C9(i,q));                                           

                                           temp = temp+ dist(C3(c,q),C0(j,q));
                                           temp = temp+ dist(C3(c,q),C4(d,q));
                                           temp = temp+ dist(C3(c,q),C5(e,q));
                                           temp = temp+ dist(C3(c,q),C6(f,q));
                                           temp = temp+ dist(C3(c,q),C7(g,q));
                                           temp = temp+ dist(C3(c,q),C8(h,q));
                                           temp = temp+ dist(C3(c,q),C9(i,q));                                          

                                           temp = temp+ dist(C4(d,q),C0(j,q));
                                           temp = temp+ dist(C4(d,q),C5(e,q));
                                           temp = temp+ dist(C4(d,q),C6(f,q));
                                           temp = temp+ dist(C4(d,q),C7(g,q));
                                           temp = temp+ dist(C4(d,q),C8(h,q));
                                           temp = temp+ dist(C4(d,q),C9(i,q));                                           
                                        
                                           temp = temp+ dist(C5(e,q),C0(j,q));
                                           temp = temp+ dist(C5(e,q),C6(f,q));
                                           temp = temp+ dist(C5(e,q),C7(g,q));
                                           temp = temp+ dist(C5(e,q),C8(h,q));
                                           temp = temp+ dist(C5(e,q),C9(i,q));
                                           
                                           temp = temp+ dist(C6(f,q),C0(j,q));
                                           temp = temp+ dist(C6(f,q),C7(g,q));
                                           temp = temp+ dist(C6(f,q),C8(h,q));
                                           temp = temp+ dist(C6(f,q),C9(i,q));
                                            
                                           temp = temp+ dist(C7(g,q),C0(j,q));
                                           temp = temp+ dist(C7(g,q),C8(h,q));
                                           temp = temp+ dist(C7(g,q),C9(i,q));                                           

                                           temp = temp+ dist(C8(h,q),C0(j,q));
                                           temp = temp+ dist(C8(h,q),C9(i,q));                                           

                                           temp = temp+ dist(C9(i,q),C0(j,q));
                                        end
                                    end
                               end
                           end
                       end
                   end
               end
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
disp('These 40 features must be filtered/deleted from list of features')
