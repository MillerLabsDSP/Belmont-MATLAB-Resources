%% sineTransform.m
% Simplified version of the Fourier Transform
% Zachary Miller
% 27 Nov 2023

clear; clc; close all;

Fs = 480;
Ts = 1/Fs;
f = 10;
t = [0:Ts:1-Ts]';

% x = square(2*pi*f*t); % Signal
x = sawtooth(2*pi*f*t,0.5);

% Analysis of each frequency using a sine wave
for f = 0:240

    p = -cos(2*pi*f*t);
    X(f+1,1) = x' * p; % inner product

end

f = [0:240];
plot(f,X);

% Plot on dB scale
% N = length(x);
% XdB = 20*log10(abs(X)/N);
% plot(f,XdB);