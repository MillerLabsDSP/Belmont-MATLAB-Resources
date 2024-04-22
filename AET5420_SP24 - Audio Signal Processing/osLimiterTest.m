%% osLimiterTest.m
% Zachary Miller
% 22 April 2024

clear; clc; close all;

[x,Fs] = audioread('funkBass - unprocessed.wav'); % mono
inputPeak = max(x); fprintf('')

inputGain = input('Input gain [1 --> no added gain]: ');
threshold = input('Threshold (linear): ');
attackMs = input('Attack (ms): ');
releaseMs = input('Release (ms): ');
holdMs = input('Hold (ms): ');
oversample = input('Oversampling? (Y/N): ','s');

if (oversample == 'Y')
    rate = 2;
else
    rate = 0;
end

y = osLimiter(x,Fs,inputGain,threshold,attackMs,releaseMs,holdMs,rate);