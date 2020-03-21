function [X1,X2]=NC()

clc;
clear;

[~, Pos]=fastaread('R_Pos880.txt');
[~, Neg]=fastaread('R_Net880.txt');

%%%%%%%%%%%%������ѵ����
E=Pos';
[r,c]=size(E); %�������У�
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %����Ԫ������Aת����һ����ͨ����Amat
    [m,n]=size(Amat);
    AJS='ACGT';
    y=zeros(1,4);
    for i=1:4
        label=AJS(i); %��������
        for h=1:n %n=41
            if (Amat(:,h)==label(1))
                y(i)=y(i)+1;
            end
        end
    end
    y=y(:)'; %����˳�����һ��
    K1=[K1;y]; %һ����һ������
end
X1=K1./n;

%%%%%%%%%%%%%������ѵ����K1
N=Neg';
[r,c]=size(N); %�������У�
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