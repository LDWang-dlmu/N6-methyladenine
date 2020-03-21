function [X13,X14]=ANF()

clc;
clear;

[~, Pos]=fastaread('M_Pos725.txt');
[~, Neg]=fastaread('M_Net725.txt');

%%%%%%%%%%%%������ѵ����
E=Pos';
[r,~]=size(E); %�������У�
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %����Ԫ������Aת����һ����ͨ����Amat
    [~,n]=size(Amat);
    AJS='ACGU';
    y=zeros(1,n);
    for i=1:4
        label=AJS(i); %��������
        for h=1:n %n=41
            if Amat(:,h)==label
                t1=Amat(1:h);
                y(:,h)=size(strfind(t1,label),2);
            end
            x(:,h)=y(:,h)/h;
        end
    end
    K1=[K1;x]; %һ����һ������
end
X13=K1;

%%%%%%%%%%%%%������ѵ����K1
N=Neg';
[r,~]=size(N); %�������У�
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