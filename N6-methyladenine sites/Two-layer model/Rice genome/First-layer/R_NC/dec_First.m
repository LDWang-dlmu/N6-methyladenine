clear
clc

k=10;
Ptrain = [];
Ntrain = [];
for i=1:k
    chr=[num2str(i),'-R_NC_dec.mat'];
    FileName = ['dec_NC_' num2str(i) '.mat'];
    a = load (FileName);
    dec = a.dec_values;
    P_dec = dec(1:88,1);
    N_dec = dec(89:176,1);
    for j=1:k
        if j~=i
            Ptrain=[Ptrain;P_dec];
            Ntrain=[Ntrain;N_dec];
        else
            Ptest=P_dec;
            Ntest=N_dec;
        end
    end
    save(chr,'Ptrain','Ntrain','Ptest', 'Ntest');
    Ptrain = [];
    Ntrain = [];
end