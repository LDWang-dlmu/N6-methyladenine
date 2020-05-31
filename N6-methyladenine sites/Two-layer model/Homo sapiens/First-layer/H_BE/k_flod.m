clc
clear

load('H_BE.mat')
[a, b] = size(X11);
k = 10; %елЪ§5,10,15
c = a/k;
rowDist = repmat(c,1,k);
Pos = mat2cell(X11,rowDist);
Net = mat2cell(X12,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-H_BE.mat'];
    for i=1:k
        X11=cell2mat(Pos(i,1));
        X12=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X11];
            Ntrain=[Ntrain;X12];
        else
            Ptest=X11;
            Ntest=X12;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
