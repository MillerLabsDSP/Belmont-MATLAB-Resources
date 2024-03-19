%% zTransform.m
% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 5;
N = 48000;

x = sin(2*pi*f*t);
z = zeros(N,1);

for n=1:N
    z(n) = exp(1) .^ (-2*pi*f*t(n)*x(n)/N);
end

plot(z);