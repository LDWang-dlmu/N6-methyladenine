clc
clear

load('R_PSTNP.mat')
[a, b] = size(X7);
k = 10; %елЪ§5,10,15
c = a/k;
rowDist = repmat(c,1,k);
Pos = mat2cell(X7,rowDist);
Net = mat2cell(X8,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-R_PSTNP.mat'];
    for i=1:k
        X7=cell2mat(Pos(i,1));
        X8=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X7];
            Ntrain=[Ntrain;X8];
        else
            Ptest=X7;
            Ntest=X8;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
