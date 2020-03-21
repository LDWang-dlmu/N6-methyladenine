%刀切法检验逻辑回归
close all
clear all
clc

load('M_First_dec.mat');
x1 = X1;
x2 = X2;

train_data=[x1;x2];
train_label=[1*ones(1,size(x1,1)),2*ones(1,size(x2,1))]';
[n c]=size(train_data);
d=zeros(n,1);
%---------------------------------------------------------------------
xc=train_data;
yc=train_label;
for i=1:n      %刀切
    test_data=train_data(i,:);
    train_data(i,:)=[];
    train_label(i,:)=[];
    Factor = mnrfit(train_data, train_label);
    Scores = mnrval(Factor, test_data);
    d(i)=Scores(1); %得分向量
    train_data=xc;
    train_label=yc;
end
n1=size(x1,1);
n2=size(x2,1);

t1=0;t2=0;%t1为第一类，t2为第二类
for i=1:n1
    if d(i)>=0.5
        t1=t1+1;
    end
end
for i=n1+1:n
    if d(i)<=0.5
        t2=t2+1;
    end
end

t1,t2
TP=t1;TN=t2;
FP=n2-t2;FN=n1-t1;
Sn=TP/(TP+FN);
Sp=TN/(TN+FP);
Acc=(TP+TN)/(TP+TN+FP+FN);
MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
result=[Sn Sp Acc MCC]
