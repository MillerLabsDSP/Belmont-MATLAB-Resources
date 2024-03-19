%% prob3.m
% This script can be used to test the function you create for problem 4.
% Your function should work based on the variables in the script.
% You should also test other sound files and buffer sizes
clear; clc; close all;
%% Initialize Input Parameters
clear; clc;

[x, Fs] = audioread('HW2.wav');
Ts = 1/Fs;

bufferSize = 4096; % Also experiment with 512, 1024, 4096

%% Test the function
% Note: you will need to create this m-file
[peakAmp,Arms,DRdB] = crestFunction(x,bufferSize);

%% Plot the results (You shouldn't need to change this)
subplot(4,1,1);
N = length(x);
t = (0:N-1).' * Ts;
plot(t,x);
title("Waveform");

subplot(4,1,2);
bSec = (0:bufferSize:N-1).' * Ts;
plot(bSec,peakAmp);
title("Peak");

subplot(4,1,3);
plot(bSec,Arms);
title("RMS");

subplot(4,1,4);
plot(bSec,DRdB);
title("Crest Factor");