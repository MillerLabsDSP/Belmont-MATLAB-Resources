% impulseTrain.m
% Zachary Miller
% 18 Oct 2023

clear; clc;

% Simple example
Fs = 100;
lenSec = 1;

N = lenSec * Fs; % Total # of samples
% Initialize signal to all zeros
x = zeros(N,1);

f = 5; % Frequency (cycles/sec)

tau = round(Fs / f); % length of a cycle: samples/cycle

x(1:tau:end,1) = 1;
plottf(x,Fs);