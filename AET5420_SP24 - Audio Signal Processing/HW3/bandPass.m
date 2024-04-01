%% bandPass.m
% Zachary Miller
% 29 March 2024

function [output] = bandPass(input,Fs,lowFreq,highFreq)

Nyq = Fs/2;

lowFreq = lowFreq/Nyq;
highFreq = highFreq/Nyq;

order = 10e1; % filter order

[h1] = fir1(order,highFreq); % LPF
[h2] = fir1(order,lowFreq,'high'); % HPF

hBPF = conv(h1,h2); % create BPF
output = conv(input,hBPF); % filter signal

end