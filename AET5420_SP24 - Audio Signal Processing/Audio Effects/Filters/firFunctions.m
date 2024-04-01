%% firFunctions.m
% Zachary Miller
% 13 March 2024

clear; clc; close all;

% Normalized 
Fs = 48000;
Nyq = Fs/2;
f1Hz = 5000;
f2Hz = 18000;
f1Norm = f1Hz/Nyq;
f2Norm = f2Hz/Nyq;

% Filter design functions
% [B] = fir1(N,Wn) where N is the filter order 
                 % and Wn is the cutoff frequency
                 % relative to Nyquist. For example,
                 % 1kHz would be 1/24 on the normalized
                 % scale when Fs = 48000.

% [b] = fir1(4,0.5); % returns b0 and b1
% h = [1 1];
% freqz(h) % boost of 6dB in lows
% stem(b);

[b] = fir1(30,[f1Norm,f2Norm],'bandpass'); % bandpass/bandstop
freqz(b);

%% fir2 example
% order = 1000;
% freq = [0 500 1000 2000 3000 5000 Fs/2];
% freqNorm = freq/Nyq;
% dBAmp = [6 6 0 0 -10 0 0];
% amp = 10.^(dBAmp./20);

% [b] = fir2(order,freqNorm,amp);

% b = [1 1];

% Plot log frequency, dB amplitude
% [H,W] = freqz(b,1,2048,Fs); % H = amp and phase, W = array of frequencies
                            % 2048 is FFT size (power of 2)

% Amplitude plot
subplot(2,1,1);
% plot(W,20*log10(abs(H))); axis([20 20000 -12 12]);
semilogx(W,20*log10(abs(H))); axis([20 20000 -12 12]);

% Phase plot
subplot(2,1,2);
plot(W,angle(H)*(180/pi));
% semilogx(W,angle(H)*(180/pi)); axis([20 20000 -90 0]);


% [x,Fs] = audioread('AcGtr.wav');
% y = conv(x,b);