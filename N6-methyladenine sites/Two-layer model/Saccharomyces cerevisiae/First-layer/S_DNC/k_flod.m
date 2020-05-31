clc
clear

load('S_DNC.mat')
[a, b] = size(X3);
k = 10; %елЪ§5,10,15
c = floor(a/k);
rowDist = repmat(c,1,k);
X3 = X3(1:k*c,:);
X4 = X4(1:k*c,:);
Pos = mat2cell(X3,rowDist);
Net = mat2cell(X4,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-S_DNC.mat'];
    for i=1:k
        X3=cell2mat(Pos(i,1));
        X4=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X3];
            Ntrain=[Ntrain;X4];
        else
            Ptest=X3;
            Ntest=X4;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
