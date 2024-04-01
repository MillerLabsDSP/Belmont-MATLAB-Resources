%% distortionAnalyses.m
% Zachary Miller
% 22 Jan 2024

clear; clc; close all;

% Sine wave input -> "fuzz effect" -> square wave output
Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:N-1]' * Ts;
f = 1000;

x = sin(2*pi*f*t);
y = square(2*pi*f*t);

% Waveform
% subplot(3,1,1);
plot(t,x,t,y);
axis([0 1 -1.1 1.1]);
legend('Input','Output');

% Characteristic curve
% subplot(3,1,2);
plot(x,x,x,y); axis([-1.1 1.1 -1.1 1.1]);

% Total Harmonic Distortion (THD) - @1kHz
% Level of the harmonics compared to the fundamental
% subplot(3,1,3);
thd(y,Fs);