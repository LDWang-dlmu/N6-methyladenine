function [X1,X2]=NC()

clc;
clear;

[~, Pos]=fastaread('S_Pos1307.txt');
[~, Neg]=fastaread('S_Net1307.txt');

%%%%%%%%%%%%������ѵ����
E=Pos';
[r,~]=size(E); %��������
K1=[];
for d=1:r
    A=E(d,:);
    Amat=cell2mat(A); %����Ԫ������Aת����һ����ͨ����Amat
    [m,n]=size(Amat);
    AJS='ACGU';
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
    AJS='ACGU'; 
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

save S_NC X1 X2