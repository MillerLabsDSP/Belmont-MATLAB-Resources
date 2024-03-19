%% AET5410 Midterm Practice
% Zachary Miller
% Signal Synthesis

clear; clc;

Fs = 48000;
f = 4;
Ts = 1/Fs;
StopTime = 4; % seconds
t = [0:Ts:StopTime-Ts]';

x=sin(2*pi*f*t);
plot(t,x);

time = 2;
timeVar = Fs * time;

newSignal = x(1:timeVar-1); % in seconds
plot(newSignal);

catNewSig = [newSignal;newSignal;newSignal;newSignal];
plot(catNewSig);