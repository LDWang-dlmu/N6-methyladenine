clear
clc

load('zhong_jicheng23478.mat');
xx1 = X1;
xx2 = X2;

xapp=[xx1;xx2];
yapp=[1*ones(1,size(xx1,1)),-1*ones(1,size(xx2,1))]';
%     [bestacc,bestc,bestg]=SVMcg1(yapp,xapp,-1,5,-5,1,15,0.5,0.5,0.9);
[bestacc,bestc,bestg]=SVMcg1(yapp,xapp,-2,5,-5,2,15,0.5,0.5,0.9);
cmd=['-c ',num2str(bestc),' -g ',num2str(bestg)];