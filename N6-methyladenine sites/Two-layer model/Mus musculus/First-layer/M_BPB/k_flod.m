clc
clear

load('M_BPB.mat')
[a, b] = size(X9);
k = 10; %елЪ§5,10,15
c = floor(a/k);
rowDist = repmat(c,1,k);
X9 = X9(1:k*c,:);
X10 = X10(1:k*c,:);
Pos = mat2cell(X9,rowDist);
Net = mat2cell(X10,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-M_BPB.mat'];
    for i=1:k
        X9=cell2mat(Pos(i,1));
        X10=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X9];
            Ntrain=[Ntrain;X10];
        else
            Ptest=X9;
            Ntest=X10;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
