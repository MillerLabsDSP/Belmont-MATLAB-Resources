%% basicHPF.m
% Zachary Miller
% 3 March 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');
N = length(x);
y = zeros(N,1);

% Delay block
d = 1; % one sample

% Gain
g = -1; % delay line only

for n=1:N
    if (n-d < 1)
        y(n,1) = x(n,1);
    else
        y(n,1) = x(n,1) + (g * x(n-d,1));
        
        % Alternative notation
        % y(n,1) = x(n) - x(n-d);
    end
end

% IR of HPF
h = [1 -1];
freqz(h);