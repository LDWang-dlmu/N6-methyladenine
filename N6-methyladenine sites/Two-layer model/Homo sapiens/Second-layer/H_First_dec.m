clear 
clc

% load('H_NC_dec_pos.mat'); %NC
load('H_DNC_dec_pos.mat'); %DNC
load('H_TNC_dec_pos.mat'); %TNC
load('H_PSTNP_dec_pos.mat'); %PSTNP
load('H_BPB_dec_pos.mat'); %BPB
load('H_BE_dec_pos.mat'); %BE
% load('H_ANF_dec_pos.mat'); %ANF


% x1 = H_NC_dec_pos;
x2 = H_DNC_dec_pos;
x3 = H_TNC_dec_pos;
x4 = H_PSTNP_dec_pos;
x5 = H_BPB_dec_pos;
x6 = H_BE_dec_pos;
% x7 = H_ANF_dec_pos;


X = [x2 x3 x4 x5 x6];
X1 = X(1:1130,1:5);
X2 = X(1131:2260,1:5);

save H_First_dec X1 X2