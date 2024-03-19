%% impulseResponse.m
% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

[x,Fs1] = audioread('monoViolin.wav');
x = x(:,1);
N = length(x);

% Sine wave
% Fs1 = 48000;
% Ts = 1/Fs1;
% t = [0:Ts:1-Ts].';
% f = 100;
% x = sin(2*pi*f*t);

d = 10000; % delay
% h = zeros(d+1,1);

% Delay system IR (synthetic)
% g1 = 0.6;
% g2 = 0.4;
% h(1,1) = g1;
% h(d+1,1) = g2;

% Schermerhorn Hall IR
[h,Fs2] = audioread('5th row.wav');
h = h(44000:length(h)); % scale
stem(h); % view IR

y = conv(x,h) * 10; % conv with gain matching

% Plot
subplot(2,1,1)
plot(x);
title('input')
subplot(2,1,2)
plot(y);
title('convolved signal')

% Dry and processed signals
% both = [x;y];
% sound(both,Fs1);