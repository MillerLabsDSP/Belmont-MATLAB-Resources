%% feedbackCombFilter.m
% Zachary Miller
% 18 April 2024

clear; clc; close all;

% [x,Fs] = audioread('AcGtr.wav');

% Impulse response
Fs = 48000; Ts = 1/Fs;
x = [1;zeros(Fs-1,1)];

N = length(x); y = zeros(N,1);
g = 0.9; d = 10;
for n=1:N

    if (n <= d)
        y(n,1) = x(n,1);
    else
        y(n,1) = x(n,1) - g * y(n-d,1);
    end

end

% subplot(2,1,1); plot(x);
% subplot(2,1,2); plot(y);
freqz(y);