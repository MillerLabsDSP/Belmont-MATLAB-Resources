%% problem2.m
% Zachary Miller
% 30 March 2024

% Test script for bandPass.m and bandStop.m functions

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
N = 48000;
impulse = [1;zeros(N-1,1)];
    % stem(impulse);

lowFreq = 1000;
highFreq = 10000;

BPFout = bandPass(impulse,Fs,lowFreq,highFreq);
figure; freqz(BPFout);

lowFreq = 1000;
highFreq = 8000;

BSFout = bandStop(impulse,Fs,lowFreq,highFreq);
figure; freqz(BSFout);