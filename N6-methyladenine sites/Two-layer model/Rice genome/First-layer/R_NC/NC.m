function [X1,X2]=NC()

clc;
clear;

[~, Pos]=fastaread('R_Pos880.txt');
[~, Neg]=fastaread('R_Net880.txt');

%%%%%%%%%%%%正样本训练集
E=Pos';
[r,c]=size(E); %计算行列；
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %将单元格数组A转换成一个普通矩阵Amat
    [m,n]=size(Amat);
    AJS='ACGT';
    y=zeros(1,4);
    for i=1:4
        label=AJS(i); %构建特征
        for h=1:n %n=41
            if (Amat(:,h)==label(1))
                y(i)=y(i)+1;
            end
        end
    end
    y=y(:)'; %特征顺序输出一行
    K1=[K1;y]; %一行是一个序列
end
X1=K1./n;

%%%%%%%%%%%%%负样本训练集K1
N=Neg';
[r,c]=size(N); %计算行列；
K2=[];
for d=1:r
    A=N(d,:);
    Amat=cell2mat(A);
    [m,n]=size(Amat);
    AJS='ACGT'; 
    y=zeros(1,4);
    for i=1:4
        label=AJS(i);
        for h=1:n
            if (Amat(:,h)==label(1))
                y(i)=y(i)+1;
            end
        end
    end
    y=y(:)';
    K2=[K2;y];
end
X2=K2./n;

save R_NC X1 X2