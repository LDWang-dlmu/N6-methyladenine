function [X3,X4]=DNC()

clc;
clear;

[hq, Pos]=fastaread('R_Pos880.txt');
[hn, Neg]=fastaread('R_Net880.txt');

k=0;%��϶ֵ

%%%%%%%%%%%%%������ѵ����K1
E=Pos';
[r,c]=size(E);%�������У�
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %����Ԫ������Aת����һ����ͨ����Amat
    [m,n]=size(Amat);
    AJS='ACGT';
    y=zeros(4,4);
    for i=1:4
        for j=1:4
            label=[AJS(i),AJS(j)];%��������
            for h=1:n-k-1 %n=21,k=0
                if (Amat(:,h)==label(1,1))&&(Amat(:,h+k+1)==label(1,2)) % A&&B,A��B
                    y(i,j)=y(i,j)+1;
                end
            end
        end
    end
    y=y(:)'; %����˳�����һ��
    K1=[K1;y]; %һ����һ������
end
X3=K1./(n-1);

%%%%%%%%%%%%%������ѵ����K1
N=Neg';
[r,c]=size(N);%�������У�
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