clc
clear

load('R_ANF.mat')
[a, b] = size(X13);
k = 10; %елЪ§5,10,15
c = a/k;
rowDist = repmat(c,1,k);
Pos = mat2cell(X13,rowDist);
Net = mat2cell(X14,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-R_ANF.mat'];
    for i=1:k
        X13=cell2mat(Pos(i,1));
        X14=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X13];
            Ntrain=[Ntrain;X14];
        else
            Ptest=X13;
            Ntest=X14;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
