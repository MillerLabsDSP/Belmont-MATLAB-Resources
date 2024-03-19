%% slewRateExample.m
% Zachary Miller
% 4 March 2024

clear; clc; close all;

% Distortion parameters
Fs = 48000; Ts = 1/Fs;
f = 6;
t = [0:Ts:1].';

x = sin(2*pi*f*t);
% x = square(2*pi*f*t);

maxFreq = 4; % maxFreq ≥ f ... no distortion
             % maxFreq < f ... distortion

y = slewRateDistortion(x,Fs,maxFreq);

plot(t,x); hold on;
plot(t,y); hold off; axis([0 1 -1.1 1.1]);
legend('Input','Output');