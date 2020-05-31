clear
clc


[xx1,xx2] = BE();

xapp=[xx1;xx2];
yapp=[1*ones(1,size(xx1,1)),-1*ones(1,size(xx2,1))]';
[bestacc,bestc,bestg]=SVMcg1(yapp,xapp,-2,5,-5,2,5,0.5,0.5,0.9);
cmd=['-c ',num2str(bestc),' -g ',num2str(bestg)];