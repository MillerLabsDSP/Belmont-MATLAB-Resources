%% analogToDigitalHPF.m
% 1st-order high-pass filter
% Zachary Miller
% 8 Feb 2024

clear; clc; close all;

R = 500e3; % Ohms
C = 82e-12; % pF

% Coefficients (dependent on filter order)
wc = 1/(R*C);
fc = 1/(2*pi*R*C); % rad

% Analog transfer function
sNum = [1 0]; % s-domain
sDen = [1 wc];

W = 2*pi*[20:20000]; % Hz
[Hs,w] = freqs(sNum,sDen,W);

semilogx(w/(2*pi),20*log10(abs(Hs)));
axis([20 24000 -30 5])

% Digital
Fs = 48000;
% k = 2*Fs;
fm = fc; % match freq (most common is to set equal to fc)
k = (2*pi*fm)/(tan(pi*fm/Fs));

b0 = k/(k+wc);
b1 = (-k)/(k+wc);
a1 = (wc-k)/(k+wc);

zNum = [b0 b1];
zDen = [1 a1];

% Analog->Digital using freqz()
% [Hz,F] = freqz(zNum,zDen,2048,Fs);
% hold on; % keeps figure open
% semilogx(F,20*log10(abs(Hz)));
% axis([20 24000 -30 5])
% legend('analog','digital');
% hold off; 

% Analog->Digital using bilinear()
[numD,denD] = bilinear(sNum,sDen,Fs);
[Hd,F] = freqz(numD,denD,2048,Fs);
hold on; % keeps figure open
semilogx(F,20*log10(abs(Hd)));
axis([20 24000 -30 5])
legend('analog','digital');
hold off;