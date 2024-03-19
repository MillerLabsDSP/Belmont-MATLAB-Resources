% ampFades.m
% Zachary Miller
% 30 Oct 2023

clear; clc;

Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:N-1]' * Ts;
f = 200;

x = sin(2*pi*f*t);

m = linspace(0,1,N)';

y = x .* m;

plot(y);
sound(y);