%½ÍÄ¸m6A½øÐÐÔ¤²â
close all
clear all
clc


[x1,x2] = BPbayes();

xapp=[x1;x2];
yapp=[1*ones(1,size(x1,1)),-1*ones(1,size(x2,1))]';
%-----------------------------------------------------
n=size(xapp,1);
xc=xapp;
yc=yapp;
d=zeros(n,1);
tic
parfor i=1:n
    xapp=[x1;x2];
    yapp=[1*ones(1,size(x1,1)),-1*ones(1,size(x2,1))]';
    xtest=xapp(i,:);
    ytest=yapp(i,:);
    xapp(i,:)=[];
    yapp(i,:)=[];
      %model=svmtrain(yapp,xapp,cmd);
    model=svmtrain(yapp,xapp,'-c 22.6274 -g 0.088388 -w1 1 -w-1 1 -b 1');
    [pre, acc, dec_values]=svmpredict(ytest,xtest,model,'-b 1');
    dec_value(i,:)=dec_values;
    d(i)=pre;
    xapp=xc;
    yapp=yc;
end
toc
n1=size(x1,1);%%%%×¢Òâ
n2=size(x2,1);

t1=0;t2=0;
for i=1:n1
    if d(i)==1
        t1=t1+1;
    end
end
for i=n1+1:n
    if d(i)==-1
        t2=t2+1;
    end
end

t1;t2;
TP=t1;TN=t2;
FP=n2-t2;FN=n1-t1;
Sn=TP/(TP+FN);
Sp=TN/(TN+FP);
Acc=(TP+TN)/(TP+TN+FP+FN);
MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
Sn,Sp,Acc,MCC
