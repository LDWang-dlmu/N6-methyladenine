clc
clear

load('M_TNC.mat')
[a, b] = size(X5);
k = 10; %елЪ§5,10,15
c = floor(a/k);
rowDist = repmat(c,1,k);
X5 = X5(1:k*c,:);
X6 = X6(1:k*c,:);
Pos = mat2cell(X5,rowDist);
Net = mat2cell(X6,rowDist);


for j=1:k
    Ptrain=[];
    Ntrain=[];
    chr=[num2str(j),'-M_TNC.mat'];
    for i=1:k
        X5=cell2mat(Pos(i,1));
        X6=cell2mat(Net(i,1));
        if j~=i
            Ptrain=[Ptrain;X5];
            Ntrain=[Ntrain;X6];
        else
            Ptest=X5;
            Ntest=X6;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
end
