% ampMeasurements.m
% Zachary Miller
% 10/2/23

clear; clc;

[x,Fs] = audioread('AcGtr.wav');

sw = audioread('sw20Hz.wav');

squareWave = square(2*pi*50*t);

Ap = max(abs(sw));
% disp(Ap);

a = [0.3; -0.7; 0.4; 0.5];

App = abs(max(a)-min(a));
disp(App);

% RMS (from function)

RMSAmp = getRMSAmplitude('AcGtr.wav');