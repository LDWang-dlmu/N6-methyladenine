function [X3,X4]=DNC()

clc;
clear;

[hq, Pos]=fastaread('R_Pos880.txt');
[hn, Neg]=fastaread('R_Net880.txt');

k=0;%间隙值

%%%%%%%%%%%%%正样本训练集K1
E=Pos';
[r,c]=size(E);%计算行列；
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %将单元格数组A转换成一个普通矩阵Amat
    [m,n]=size(Amat);
    AJS='ACGT';
    y=zeros(4,4);
    for i=1:4
        for j=1:4
            label=[AJS(i),AJS(j)];%构建特征
            for h=1:n-k-1 %n=21,k=0
                if (Amat(:,h)==label(1,1))&&(Amat(:,h+k+1)==label(1,2)) % A&&B,A且B
                    y(i,j)=y(i,j)+1;
                end
            end
        end
    end
    y=y(:)'; %特征顺序输出一行
    K1=[K1;y]; %一行是一个序列
end
X3=K1./(n-1);

%%%%%%%%%%%%%负样本训练集K1
N=Neg';
[r,c]=size(N);%计算行列；
K2=[];
for d=1:r
    A=N(d,:);
    Amat=cell2mat(A);
    [m,n]=size(Amat);
    AJS='ACGT';
    y=zeros(4,4);
    for i=1:4
        for j=1:4
            label=[AJS(i),AJS(j)];
            for h=1:n-k-1
                if (Amat(:,h)==label(1,1))&&(Amat(:,h+k+1)==label(1,2))
                    y(i,j)=y(i,j)+1;
                end
            end
        end
    end
    y=y(:)';
    K2=[K2;y];
end 
X4=K2./(n-1);

save R_DNC X3 X4