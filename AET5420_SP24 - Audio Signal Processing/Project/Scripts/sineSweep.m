%% sineSweep.m
% Zachary Miller, Alek Weidman, John Sweeney

% 21 March 2024

clear; clc; close all;

% Linear
Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:10];
xLin = chirp(t,0,10,22000).';

% Logarithmic
xLog = chirp(t,1,10,22000,'logarithmic').';
N = length(xLog);

% Apply fade-in/fade-out
fade = [linspace(0,1,10000).';ones(N-20000,1);linspace(1,0,10000).'];
y = xLog .* fade;

audiowrite('logsweep - with fades.wav',y,Fs);