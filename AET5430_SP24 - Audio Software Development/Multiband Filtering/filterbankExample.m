%% filterbankExample.m
% Zachary Miller
% 1 March 2024

% Hack Audio (Ch. 13)

clear; clc; close all;

[in,Fs] = audioread('AcGtr.wav');
N = length(in);

Fs = 48000;
Nyq = Fs/2;
m = 2; % filter order

numOfBands = 1;
% out = zeros(N,numOfBands);

% Logarithmically space cutoff frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz

freq = 2 * logspace(1,4,numOfBands+1);

for band = 1:numOfBands

    Wn = [freq(band),freq(band+1)] ./ Nyq;
    [b(:,band),a(:,band)] = butter(m,Wn);

    % Plot bands
    [h,w] = freqz(b(:,band),a(:,band),4096,Fs);
    semilogx(w,20*log10(abs(h)));
    hold on;

end

hold off;
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');

% out = sum(out,2);
% sound([in;out],Fs);

