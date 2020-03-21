clear 
clc

% load('M_NC_dec_pos.mat'); %NC
load('M_DNC_dec_pos.mat'); %DNC
load('M_TNC_dec_pos.mat'); %TNC
load('M_PSTNP_dec_pos.mat'); %PSTNP
load('M_BPB_dec_pos.mat'); %BPB
load('M_BE_dec_pos.mat'); %BE
% load('M_ANF_dec_pos.mat'); %ANF


% x1 = M_NC_dec_pos;
x2 = M_DNC_dec_pos;
x3 = M_TNC_dec_pos;
x4 = M_PSTNP_dec_pos;
x5 = M_BPB_dec_pos;
x6 = M_BE_dec_pos;
% x7 = M_ANF_dec_pos;

X = [x2 x3 x4 x5 x6];
X1 = X(1:725,1:5);
X2 = X(726:1450,1:5);

save M_First_dec X1 X2