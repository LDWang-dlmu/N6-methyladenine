function [X9,X10] = BPbayes()

clc;
clear;

% % ---------------------数据集
[h1, Ptrain]=fastaread('M_Pos725.txt');
n1=length(h1);%number of positive samples

[h2, Ntrain]=fastaread('M_Net725.txt');
n2=length(h2);%number of negative samples

AA='ACGU';
M=length(Ptrain{1,1});%长度
x=(M+1)/2;
% % 中间位置的“k”去掉
for i=1:n1
    Ptrain{1,i}(x)='';
    s=Ptrain{1,i};%s变为40个，中间的K被去掉
    Ptrain{1,i}=s;
end

for i=1:n2
    Ntrain{1,i}(x)='';
    s=Ntrain{1,i};
    Ntrain{1,i}=s;
end

M=length(Ptrain{1,1});
F1=zeros(4,M);
F2=zeros(4,M);

for m=1:n1
    for j=1:M
        t=Ptrain{1,m}(j);
        k=strfind(AA,t);
        F1(k,j)=F1(k,j)+1;
    end
end

for m=1:n2
    for j=1:M
        t=Ntrain{1,m}(j);
        k=strfind(AA,t);
        F2(k,j)=F2(k,j)+1;
    end
end

F1= F1/n1;
F2= F2/n2;

% % -----------------------------构建特征向量
PT1=zeros(n1,2*M); %positive dataset的特征矩阵
PT2=zeros(n2,2*M); %negative dataset的特征矩阵
for m=1:n1
    for j=1:M
        t=Ptrain{1,m}(j);
        if t=='x'
            continue
        end
        if t=='X'
            continue
        end
        if t=='-'
            continue
        end
        if t=='O'
            continue
        end
        k=strfind(AA,t);
        PT1(m,j)=F1(k,j);
        PT1(m,M+j)=F2(k,j);
    end
end

for m=1:n2
    for j=1:M
        t=Ntrain{1,m}(j);
        if t=='x'
            continue
        end
        if t=='X'
            continue
        end
        if t=='-'
            continue
        end
        if t=='O'
            continue
        end
        k=strfind(AA,t);
        PT2(m,j)=F1(k,j);
        PT2(m,M+j)=F2(k,j);
    end
end

X9=PT1;
X10=PT2;

save M_BPB X9 X10

