%% feedBackDelay.m
% Implementation of multi-tap echo

% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');

N = length(x);

% Samples of delay
d = 12000;
g = 0.9; % sometimes a percentage
         % [0-1] ... PT goes negative for polarity inversion

y = zeros(N,1);

for n=1:N
    if (n-d < 1)
        y(n,1) = x(n,1);
    else
        y(n,1) = x(n,1) + g * y(n-d,1);
    end
end

plot(y);