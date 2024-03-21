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

audiowrite('logsweep.wav',xLog,Fs);