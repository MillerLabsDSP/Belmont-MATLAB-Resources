% signalSynthesis.m
% Zachary Miller
% 16 Oct 2023

clear; clc;

Fs = 48000;
lenSec = 1;
N = lenSec * Fs;

noise = randn(N,1); % random sequence of numbers
% noise = noise/max(abs(noise)); % peak normalization
plottf(noise,Fs);
sound(noise);