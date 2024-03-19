%% linFade.m
% Zachary Miller

clear; clc; close all;

Fs = 48000;
f = 500;
Ts = 1/Fs;

t = [0:Ts:4].';
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
        y(n,1) = x(n,1) * a(linSpaceCounter,1);
        linSpaceCounter = linSpaceCounter + 1;
    else
        y(n,1) = x(n,1);
    end
end

plot(y);