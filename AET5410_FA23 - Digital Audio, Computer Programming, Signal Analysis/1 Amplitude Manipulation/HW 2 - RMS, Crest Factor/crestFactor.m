% crestFactor.m
% HW2 - Q2
% Zachary Miller
% 7 Oct 2023

clear; clc;
filename = 'HW2.wav';
[x,Fs] = audioread(filename);

% Time domain (s)
t = (0:length(x)-1)/Fs;    

% Max amplitude of signal
peakAmp = 0; sigSqrSum = 0;
sigLen = length(x);

for i=1:sigLen
    if (abs(x(i)) > peakAmp)
        peakAmp = abs(x(i));
    end
end

% disp(peakAmp);

% RMS of signal
for i=1:sigLen
    sigSqrSum = sigSqrSum + x(i) .^ 2;
end

P = sigSqrSum/sigLen;
Arms = sqrt(P);
% disp(Arms);

% Crest factor
cF = abs(peakAmp) / Arms;
% disp(cF);

% Crest factor (dB)
DRdB = 20 * log10(abs(peakAmp)/Arms);
disp(DRdB);