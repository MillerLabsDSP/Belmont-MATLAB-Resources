%% AET5410 Midterm Practice
% Zachary Miller
% Equal Power Fade

clear; clc;

Fs = 48000;
f = 500;
Ts = 1/Fs;
StopTime = 2; % input (seconds)
t = [0:Ts:StopTime-Ts]';

x=sin(2*pi*f*t);
N = length(x);

fadeOutSec = 1.5;
fadeOutSamples = fadeOutSec * Fs;

w = N - fadeOutSamples;
a = linspace(1,0,fadeOutSamples);
b = zeros(fadeOutSamples,1);

for i=1:fadeOutSamples
    b(i,1) = sqrt(a(i));
end

newSignalDim = zeros(N,1);
linSpaceCounter = 1;

for n=1:N
    if (n>w)
        newSignalDim(n,1) = x(n,1) * b(linSpaceCounter,1);
        linSpaceCounter = linSpaceCounter + 1;
    else
        newSignalDim(n,1) = x(n,1);
    end
end

plot(t,newSignalDim);
sound(newSignalDim,44100);