% ringModulation.m
% Zachary Miller
% 30 Oct 2023

clear; clc;

Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:N-1]' * Ts;
f = 200;

fr = 1000;
r = sin(2*pi*fr*t);
m = sin(2*pi*fm*t);

y = r .* m;
plot(y);