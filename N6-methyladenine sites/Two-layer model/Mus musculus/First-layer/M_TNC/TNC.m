function [X5,X6] =TNC()
clc;
clear;
AA='ACGU';
BB='ACGU';
CC='ACGU';
m=length(AA);%4
r=0;
 for i=1:m
       x1=AA(i);
    for j=1:m
         x2=BB(j);
        for t=1:m
           x3=CC(t);
           x=strcat(x1,x2,x3);
           r=r+1;
           H{1,r}=x;           
        end
    end
    
 end
 
 %-----------------训练集
[hp, positive]=fastaread('M_Pos725.txt');
Np=length(hp);
[hn, negative]=fastaread('M_Net725.txt');
Nn=length(hn);%n

M=length(positive{1,1});%正负样本都一样长
W1=zeros(Np,m^3);
W2=zeros(Nn,m^3);

for i=1:Np
    for j=1:M-2
    s=positive{1,i};
    a1=s(j);
    a2=s(j+1);
    a3=s(j+2);
    a=strcat(a1,a2,a3);
    g=strmatch(a,H,'exact');
    W1(i,g)=W1(i,g)+1;
    end
end
X5=W1/(M-2);

for i=1:Nn
    for j=1:M-2
    s=negative{1,i};
    a1=s(j);
    a2=s(j+1);
    a3=s(j+2);
    a=strcat(a1,a2,a3);
    g=strmatch(a,H,'exact');
    W2(i,g)=W2(i,g)+1;
    end
end
X6=W2/(M-2);

save M_TNC X5 X6
