%支持向量机独立测试
close all
clear all
clc

load('10-R_BE.mat')

train_x =[Ptrain;Ntrain];
train_y = [1*ones(1,size(Ptrain,1)),-1*ones(1,size(Ntrain,1))]';
test_x = [Ptest;Ntest];
test_y = [1*ones(1,size(Ptest,1)),-1*ones(1,size(Ntest,1))]'; 

model=svmtrain(train_y,train_x, '-c 1 -g 0.17678 -w1 1 -w-1 1 -b 1');
[pre,acc,dec_values]=svmpredict(test_y,test_x,model,'-b 1');
t=size(test_y,1);
pt=numel(find(test_y==1));
nt=numel(find(test_y==-1));
TP=numel(find(pre(1:pt,1)==1));
TN=numel(find(pre(pt+1:t,1)==-1));
%[X,Y,THRE,AUC] = perfcurve(test_y,dec_values(:,1),'1');
% plot(X,Y)
% title('The ROC curves');
FP=nt-TN;FN=pt-TP;
value=[TP,FP,TN,FN];
Sn=TP/(TP+FN)
Sp=TN/(TN+FP)
Acc=(TP+TN)/(TP+TN+FP+FN)
MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN))
Result=[Sn,Sp,Acc,MCC]


