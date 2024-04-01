%% bandStop.m
% Zachary Miller
% 29 March 2024

function [output] = bandStop(input,Fs,lowFreq,highFreq)

Nyq = Fs/2;

lowFreq = lowFreq/Nyq;
highFreq = highFreq/Nyq;

order = 10e1; % filter order

[h1] = fir1(order,lowFreq); % LPF
[h2] = fir1(order,highFreq,'high'); % HPF

% Process input in parallel
BSF_LowPass = conv(input,h1);
BSF_HighPass = conv(input,h2);

% Sum output
output = BSF_LowPass + BSF_HighPass;

end