%% AET5410 Midterm Practice
% Zachary Miller
% Concatenating Signals, solution 3

clear; clc;

Fs = 48000;
f = 500;
Ts = 1/Fs;
StopTime = 8; % input (seconds)
t = [0:Ts:StopTime-Ts]';

x=sin(2*pi*f*t);
fadeOutSec = 1;
fadeOutSamples = fadeOutSec * Fs;

a = linspace(1,0,fadeOutSamples).';

N = length(x);
w = N - fadeOutSamples;
y = zeros(N,1);

linSpaceCounter = 1;

for n=1:N
    if (n>w)
        newSignalDim(n,1) = x(n,1) * a(linSpaceCounter,1);
        linSpaceCounter = linSpaceCounter + 1;
    else
        newSignalDim(n,1) = x(n,1);
    end
end

plot(t,newSignalDim);