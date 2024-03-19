%% MLMBPcomp_multibandProcessing.m
% Zachary Miller
% 23 Feb 2024

clear; clc; close all;

% Input signal
% in = [1;zeros(Fs-1,1)];
[in,Fs] = audioread('AcGtr.wav');

Nyq = Fs/2;
m = 2; % filter order

numOfBands = 2;

% Logarithmically spaced cutoff frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz;
freq = 2 * logspace(1,4,numOfBands+1);

N = length(in);
outBands = zeros(N,numOfBands);

% Perform effect
for band=1:numOfBands

    Wn = [freq(1,band),freq(1,band+1)] ./ Nyq; % cutoff frequencies
    [b(:,band),a(:,band)] = butter(m,Wn,'bandpass'); % filter coefficients

    % Plot multiband overlay
    [h,w] = freqz(b(:,band),a(:,band),4096,Fs);
    semilogx(w,20*log10(abs(h)));
    hold on;

    % Filter input signal and store result
    outBands(:,band) = filter(b(:,band),a(:,band),in);
    
end

hold off;

% Sum together bands
out = sum(outBands,2);

% Compare input/output
subplot(2,1,1); plot(in);
subplot(2,1,2); plot(out);

% Listen to output
% sound(out,Fs); 