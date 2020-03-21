function [X7,X8]=PSTNP()

clc
clear

[hp, positive]=fastaread('R_Pos880.txt');
Np=length(hp);%number of positive samples

[hn, negative]=fastaread('R_Net880.txt');
Nn=length(hn);%number of negative samples


AA='ACGT';
M=length(positive{1,1});
F1=zeros(4^3,M-2);
F2=zeros(4^3,M-2);

for m=1:Np
    for j=1:M-2
        t1=positive{1,m}(j);
        k1=strfind(AA,t1);
        t2=positive{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=positive{1,m}(j+2);
        k3=strfind(AA,t3);
        %a=strcat(t1,t2);
        F1(16*(k1-1)+4*(k2-1)+k3,j)=F1(16*(k1-1)+4*(k2-1)+k3,j)+1;
    end
end
F1=F1/Np;

for m=1:Nn
    for j=1:M-2
        t1=negative{1,m}(j);
        k1=strfind(AA,t1);
        t2=negative{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=negative{1,m}(j+2);
        k3=strfind(AA,t3);
        %a=strcat(t1,t2);
        F2(16*(k1-1)+4*(k2-1)+k3,j)=F2(16*(k1-1)+4*(k2-1)+k3,j)+1;
    end
end
F2=F2/Nn;
F=F1-F2;

PT1=zeros(Np,M-2); %positive dataset的特征矩阵
PT2=zeros(Nn,M-2); %negative dataset的特征矩阵

for m=1:Np
    for j=1:M-2
        t1=positive{1,m}(j);
        k1=strfind(AA,t1);
        t2=positive{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=positive{1,m}(j+2);
        k3=strfind(AA,t3);
        PT1(m,j)=F(16*(k1-1)+4*(k2-1)+k3,j);
    end
end

for m=1:Nn
    for j=1:M-2
        t1=negative{1,m}(j);
        k1=strfind(AA,t1);
        t2=negative{1,m}(j+1);
        k2=strfind(AA,t2);
        t3=negative{1,m}(j+2);
        k3=strfind(AA,t3);
        PT2(m,j)=F(16*(k1-1)+4*(k2-1)+k3,j);
    end
end

X7=PT1;
X8=PT2;

save R_PSTNP X7 X8