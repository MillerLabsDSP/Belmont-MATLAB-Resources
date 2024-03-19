%% filterBank.m
% Hack Audio Example (Ch. 13)
% 23 Feb 2024

clear; clc; close all;

Fs = 48000;
Nyq = Fs/2;
m = 2; % filter order

numOfBands = 4;

% Logarithmically spaced cutoff frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz;
freq = 2 * logspace(1,4,numOfBands+1);

for band=1:numOfBands

    Wn = [freq(band),freq(band+1)] ./ Nyq;
    [b(:,band),a(:,band)] = butter(m,Wn);

    [h,w] = freqz(b(:,band),a(:,band),4096,Fs);
    semilogx(w,20*log10(abs(h)));
    hold on;

end

hold off;
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');