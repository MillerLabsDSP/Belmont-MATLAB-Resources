%% expSoftClipTest.m
% Zachary Miller
% 22 Feb 2024

clear; clc; close all;

% Parameters
% Fs = 48000;
% Ts = 1/Fs;
% t = [0:Ts:1-Ts].';
% f = 1;

gain = 5;

% Synthesize input and modulate signal
% x = sin(2*pi*f*t);

% Audio signal
[x,Fs] = audioread('stereoDrums.wav'); 
N = length(x);
y = expSoftClip(x,gain);

t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1)
plot(t,x);
title('Input');
subplot(2,1,2)
plot(t,y);
title('Output');
% figure;
% plot(x,x,x,y);
% title('Characteristic Curve');

sound(y,Fs);