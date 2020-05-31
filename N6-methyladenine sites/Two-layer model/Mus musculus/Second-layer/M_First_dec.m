clear
clc

k=10;
dec_Ptrain = [];
dec_Ntrain = [];
dec_Ptest = [];
dec_Ntest = [];
for i=1:k
%     FileName = [ num2str(i) '-M_NC_dec.mat'];
%     a = load (FileName);
%     dec_Ptrain = a.Ptrain;
%     dec_Ntrain = a.Ntrain;
%     dec_Ptest = a.Ptest;
%     dec_Ntest = a.Ntest;
    
    FileName = [ num2str(i) '-M_DNC_dec.mat'];
    a = load (FileName);
    dec_Ptrain = [dec_Ptrain, a.Ptrain];
    dec_Ntrain = [dec_Ntrain, a.Ntrain];
    dec_Ptest = [dec_Ptest, a.Ptest];
    dec_Ntest = [dec_Ntest, a.Ntest];
    
    FileName = [ num2str(i) '-M_TNC_dec.mat'];
    a = load (FileName);
    dec_Ptrain = [dec_Ptrain, a.Ptrain];
    dec_Ntrain = [dec_Ntrain, a.Ntrain];
    dec_Ptest = [dec_Ptest, a.Ptest];
    dec_Ntest = [dec_Ntest, a.Ntest];
    
    FileName = [ num2str(i) '-M_PSTNP_dec.mat'];
    a = load (FileName);
    dec_Ptrain = [dec_Ptrain, a.Ptrain];
    dec_Ntrain = [dec_Ntrain, a.Ntrain];
    dec_Ptest = [dec_Ptest, a.Ptest];
    dec_Ntest = [dec_Ntest, a.Ntest];
    
    FileName = [ num2str(i) '-M_BPB_dec.mat'];
    a = load (FileName);
    dec_Ptrain = [dec_Ptrain, a.Ptrain];
    dec_Ntrain = [dec_Ntrain, a.Ntrain];
    dec_Ptest = [dec_Ptest, a.Ptest];
    dec_Ntest = [dec_Ntest, a.Ntest];
    
    FileName = [ num2str(i) '-M_BE_dec.mat'];
    a = load (FileName);
    dec_Ptrain = [dec_Ptrain, a.Ptrain];
    dec_Ntrain = [dec_Ntrain, a.Ntrain];
    dec_Ptest = [dec_Ptest, a.Ptest];
    dec_Ntest = [dec_Ntest, a.Ntest];
    
%     FileName = [ num2str(i) '-M_ANF_dec.mat'];
%     a = load (FileName);
%     dec_Ptrain = [dec_Ptrain, a.Ptrain];
%     dec_Ntrain = [dec_Ntrain, a.Ntrain];
%     dec_Ptest = [dec_Ptest, a.Ptest];
%     dec_Ntest = [dec_Ntest, a.Ntest];
    
    chr=[num2str(i),'-M_First_dec.mat'];
    save(chr,'dec_Ptrain','dec_Ntrain','dec_Ptest', 'dec_Ntest');
    dec_Ptrain = [];
    dec_Ntrain = [];
    dec_Ptest = [];
    dec_Ntest = [];
end