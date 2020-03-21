clear 
clc

% load('S_NC_dec_pos.mat'); %NC
load('S_DNC_dec_pos.mat'); %DNC
load('S_TNC_dec_pos.mat'); %TNC
load('S_PSTNP_dec_pos.mat'); %PSTNP
load('S_BPB_dec_pos.mat'); %BPB
load('S_BE_dec_pos.mat'); %BE
% load('S_ANF_dec_pos.mat'); %ANF


% x1 = S_NC_dec_pos;
x2 = S_DNC_dec_pos;
x3 = S_TNC_dec_pos;
x4 = S_PSTNP_dec_pos;
x5 = S_BPB_dec_pos;
x6 = S_BE_dec_pos;
% x7 = S_ANF_dec_pos;


X = [x2 x3 x4 x5 x6];
X1 = X(1:1307,1:5);
X2 = X(1308:2614,1:5);

save S_First_dec X1 X2