%% diodeModel.m
% Zachary Miller
% 9 April 2024

clear; clc; close all;

Is_sil = 10^-12; % silicon diode
Is_ger = 10^-6; % germanium diode
Vt = 0.026;
eta = 1;

Vd = [-0.1:0.0001:0.1];

id_sil = Is_sil * (exp(Vd/(Vt*eta)) - 1);
id_ger = Is_ger * (exp(Vd/(Vt*eta)) - 1);
subplot(2,1,1); plot(Vd,id_sil);
xline(0); yline(0);
title('Silicon Diode');
subplot(2,1,2); plot(Vd,id_ger);
xline(0); yline(0);
title('Germanium Diode');