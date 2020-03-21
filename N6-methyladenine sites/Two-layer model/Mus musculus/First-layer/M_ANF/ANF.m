function [X13,X14]=ANF()

clc;
clear;

[~, Pos]=fastaread('M_Pos725.txt');
[~, Neg]=fastaread('M_Net725.txt');

%%%%%%%%%%%%正样本训练集
E=Pos';
[r,~]=size(E); %计算行列；
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %将单元格数组A转换成一个普通矩阵Amat
    [~,n]=size(Amat);
    AJS='ACGU';
    y=zeros(1,n);
    for i=1:4
        label=AJS(i); %构建特征
        for h=1:n %n=41
            if Amat(:,h)==label
                t1=Amat(1:h);
                y(:,h)=size(strfind(t1,label),2);
            end
            x(:,h)=y(:,h)/h;
        end
    end
    K1=[K1;x]; %一行是一个序列
end
X13=K1;

%%%%%%%%%%%%%负样本训练集K1
N=Neg';
[r,~]=size(N); %计算行列；
K2=[];
for d=1:r
    A=N(d,:);
    Amat=cell2mat(A);
    [m,n]=size(Amat);
    AJS='ACGU';
    y=zeros(1,n);
    for i=1:4
        label=AJS(i);
        for h=1:n
            if Amat(:,h)==label
                t1=Amat(1:h);
                y(:,h)=size(strfind(t1,label),2);
            end
            x(:,h)=y(:,h)/h;
        end
    end
    K2=[K2;x];
end
X14=K2;

save M_ANF X13 X14