%% basicFilterbank.m
% Zachary Miller
% 1 March 2024

% Hack Audio (Ch. 13)

clear; clc; close all;

Fs = 48000;
Nyq = Fs/2;
n = 8;
Wn = 1000/Nyq;

[bLow,aLow] = butter(n,Wn);
[bHi,aHi] = butter(n,Wn,'high');

[hLow,w] = freqz(bLow,aLow,4096,Fs);
[hHi] = freqz(bHi,aHi,4096,Fs);

semilogx(w,20*log10(abs(hLow)),w,20*log10(abs(hHi)));
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');
legend('LPF','HPF');