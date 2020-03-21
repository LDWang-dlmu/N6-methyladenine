function [X11, X12]=BE()

clc;
clear;

[hp, positive]=fastaread('H_Pos1130.txt');
Np=length(hp);%number of positive samples

[hn, negative]=fastaread('H_Net1130.txt');
Nn=length(hn);%number of negative samples

L=length(positive{1,1});
AA='ACGU';
e=length(AA);
a =eye(e,e);
b1=zeros(L,e);
for i=1:Np
    for j=1:L
        s=positive{i}(j);
        t=strfind(AA,s);
        b1(j,:)=a(t,:);
    end
    c1=b1';
    d1(i,:)=c1(:)';
end

b2=zeros(L,e);
for i=1:Nn
    for j=1:L
        s=negative{i}(j);
        t=strfind(AA,s);
        b2(j,:)=a(t,:);
    end
    c2=b2';
    d2(i,:)=c2(:)';
end

X11=d1;
X12=d2;

save H_BE X11 X12;