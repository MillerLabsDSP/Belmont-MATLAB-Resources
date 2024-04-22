%% basicLPF.m
% Zachary Miller
% 3 March 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');
N = length(x);
y = zeros(N,1);

% Delay block
d = 1; % one sample

for n=1:N
    if (n-d < 1)
        y(n,1) = x(n,1);
    else
        y(n,1) = x(n,1) + x(n-d,1);
    end
end

% IR of LPF
h = [1 1];
freqz(h);