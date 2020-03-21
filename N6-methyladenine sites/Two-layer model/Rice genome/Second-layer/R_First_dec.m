clear 
clc

load('R_NC_dec_pos.mat'); %NC
load('R_DNC_dec_pos.mat'); %DNC
load('R_TNC_dec_pos.mat'); %TNC
load('R_PSTNP_dec_pos.mat'); %BPB
load('R_BPB_dec_pos.mat'); %ANF
load('R_BE_dec_pos.mat'); %PSTNP
load('R_ANF_dec_pos.mat'); %Code01

x1 = R_NC_dec_pos;
x2 = R_DNC_dec_pos;
x3 = R_TNC_dec_pos;
x4 = R_PSTNP_dec_pos;
x5 = R_BPB_dec_pos;
x6 = R_BE_dec_pos; 
x7 = R_ANF_dec_pos;

X = [x1 x2 x3 x4 x5 x6 x7];
X1 = X(1:880,1:7);
X2 = X(881:1760,1:7);

save R_First_dec X1 X2