clc
clear

load('R_NC.mat')
[a, b] = size(X1);
k = 10; %елЪ§5,10,15
c = a/k;
rowDist = repmat(c,1,k);
Pos = mat2cell(X1,rowDist);
Net = mat2cell(X2,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-R_NC.mat'];
    for i=1:k
        X1=cell2mat(Pos(i,1));
        X2=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X1];
            Ntrain=[Ntrain;X2];
        else
            Ptest=X1;
            Ntest=X2;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
