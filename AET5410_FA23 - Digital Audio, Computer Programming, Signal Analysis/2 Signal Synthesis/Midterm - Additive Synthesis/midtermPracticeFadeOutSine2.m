%% AET5410 Midterm Practice
% Zachary Miller
% Concatenating Signals, solution 2

clear; clc;

Fs = 48000;
f = 500;
Ts = 1/Fs;
StopTime = 8; % input (seconds)
t = [0:Ts:StopTime-Ts]';

x=sin(2*pi*f*t);
fadeOutSec = 1; % input
fadeOutSamples = fadeOutSec * Fs;

m = linspace(1,0,fadeOutSamples)';
N = length(x);
w = N - fadeOutSamples;

newSignalDim = zeros(N,1);

linSpaceCounter=1;

for i=1:N
    if (i <= w)
        newSignalDim(i,1) = x(i,1);
    else
        newSignalDim(i,1) = x(i,1) * m(linSpaceCounter,1);
        linSpaceCounter=linSpaceCounter+1;
    end
end

plot(t,newSignalDim);