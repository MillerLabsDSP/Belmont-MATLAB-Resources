%% transistorClippingTest.m
% Zachary Miller
% 25 Jan 2024

clear; clc; close all;

% Sine wave test input
Fs = 96000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 5;
x = sin(2*pi*f*t); % sine wave input signal

% [x,Fs] = audioread('BassDI.wav'); % DI bass input signal

% Peak value of input signal
max(x);
disp("Peak value of input signal:");
disp(max(x));

% Clip
% threshold = 0.7; % threshold for homework graph comparison
threshold = 0.7; % max val of LA3A print
y = transistorClipping(x,threshold) * 2.5; % output signal w/ gain increase

% Plot signal comparison
% subplot(2,1,1)
% plot(y);
% axis([0 length(x) -max(x) max(x)])
% title('original signal')
% subplot(2,1,2)
% plot(y);
% axis([0 length(x) -max(x) max(x)])
% title('clipped signal')

% LA3A comparison
% [LA3A] = audioread('LA3APrint.wav');
% sound([y;LA3A],Fs);