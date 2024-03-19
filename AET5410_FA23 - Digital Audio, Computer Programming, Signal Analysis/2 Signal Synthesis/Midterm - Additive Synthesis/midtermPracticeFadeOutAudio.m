%% AET5410 Midterm Practice
% Zachary Miller
% Concatenating Signals, solution 4

clear; clc;

[x,Fs] = audioread('AcGtr.wav');
Ts = 1/Fs;
N = length(x);
TotalTime = (N-1)/Fs;
t = [0:Ts:TotalTime]'; % seconds

fadeOutSec = 7.0827;
fadeOutSamples = fadeOutSec * Fs;

w = N - fadeOutSamples;
a = linspace(1,0,fadeOutSamples).';
newSignalDim = zeros(N,1);
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
sound(newSignalDim,44100);