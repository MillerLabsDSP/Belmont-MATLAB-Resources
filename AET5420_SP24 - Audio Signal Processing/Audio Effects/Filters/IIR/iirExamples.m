%% iirExamples.m
% Zachary Miller
% 3 April 2024

clear; clc; close all;

% IIR filters use b: "ff gains" and a: "fb gains"
b = 1;
% a = [1 1]; % high resonance -> inf
% a = [1 -1]; % low resonance -> inf
a = [1 0 0.5]; % [gain at add, gain of 1st delay, gain of 2nd delay]
freqz(b,a);

% Note: 

% Feed-forward delay for cuts, feed-back delay for boosts
% Frequencies of interest (0, Nyq, etc.) are identical for FF and FB delays