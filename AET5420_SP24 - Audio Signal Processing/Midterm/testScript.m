%% testScript.m
% Use this script to test your function for Test 1

clear; clc; close all;

% Input signal
[x,Fs] = audioread('Vocal.wav');

% Effect Parameters (try different values)
delayMS = 200; % range = [100 - 500]
bits = 10;      % range = [2 - 16]
mix = 0.4;     % range = [0 - 1]

% You need to write this function
y = hDelay(x,Fs,delayMS,mix,bits);

% Listen to the sound file
sound(y,Fs);