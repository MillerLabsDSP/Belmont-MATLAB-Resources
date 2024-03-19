%% attenuationCircuit.m
% Zachary Miller
% 1 Feb 2024

% Circuit model for attenuation using resistors in both
% a series and in parallel.

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');

% Resistors
R1 = 1000; % Ohms
R2 = 5000;
R3 = 6000;

G = (R1*R2) / (R1*R3 + R1*R2 + R2*R3);
y = x * G;

subplot(2,1,1)
plot(x);
title('input')
subplot(2,1,2)
plot(y);
title('output')