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

% LFO
fm = 1; % Hz
m = 0.5 * sin(2*pi*fm*t) + 0.5;

y = x .* m;
plot(y);

% Ring modulation

% fr = 1000;
% r = sin(2*pi*fr*t);
% 
% y = x .* r;
% plottf(y,Fs);