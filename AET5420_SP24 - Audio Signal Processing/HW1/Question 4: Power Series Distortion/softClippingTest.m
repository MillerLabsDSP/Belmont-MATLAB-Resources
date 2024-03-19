%% softClippingTest.m

clear; clc; close all;

% Input signal
Fs = 44100;
f = 2; % frequency is 2 hz
t = [0:1/Fs:1].'; % Time vector of samples
inputSignal = sin(2*pi*f.*t);  % Signal to be used as the input to each function
N = 44100;

%% Soft-clipping
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
outputSC = softClip(inputSignal);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); subplot(1,2,1);  plot(t,inputSignal,t,outputSC); title('Soft-clipping Effect');
subplot(1,2,2); plot(inputSignal,outputSC); title('Input vs. Output'); axis([-1 1 -1 1]);