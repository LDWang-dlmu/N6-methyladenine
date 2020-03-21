%刀切法检验KNN
load('R_First_dec.mat');
x1 = X1;
x2 = X2;


train_data=[x1;x2];
train_label=[1*ones(1,size(x1,1)),2*ones(1,size(x2,1))]';
[n c]=size(train_data);
d=zeros(n,1);
n1=size(x1,1);
n2=size(x2,1);
[n c]=size(train_data);
d=zeros(n,1);
%---------------------------------------------------------------------
xc=train_data;
yc=train_label;
for i=1:n
    test_data=train_data(i,:);
    train_data(i,:)=[];
    [ncb,dcb] =knnsearch(train_data, test_data, 'K', 5); %取5个点
    %     IDX = knnsearch(X,Y) finds the nearest neighbor in X for each point in
    %     Y. X is an MX-by-N matrix and Y is an MY-by-N matrix. Rows of X and Y
    %     correspond to observations and columns correspond to variables. IDX is
    %     a column vector with MY rows. Each row in IDX contains the index of
    %     the nearest neighbor in X for the corresponding row in Y.
    %     在向量机和 X中找到分别与向量集合Y中每个行向量最近的邻居
    pneighbor=0;
    for j=1:5
        if ncb(j)<=n1
            pneighbor=pneighbor+1;
        end
    end
    if pneighbor>=4
        d(i)=1;
    else
        d(i)=2;
    end
    train_data=xc;
    train_label=yc;
end
%----------------------------
t1=0;t2=0;
for i=1:n1
    if d(i)==1
        t1=t1+1;
    end
end
for i=n1+1:n
    if d(i)==2
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
