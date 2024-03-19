%% zeroPaddingEcho.m
% Zachary Miller
% 31 Jan 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');

% % Delay by ms
% msDelay = 500;
% secDelay = msDelay/1000;

% Tempo-synchronized echo
    
    % 0.25, sixteenth note
    % 0.5, eighth note
    % 1, quarter note
    % 2, half note
    % 4, whole note

    note = 2;
% ===========================

BPM = 103;
BPS = BPM/60;
SPB = 1/BPS;

secDelay = SPB * note;

samplesOfDelay = round(secDelay * Fs);
pad = zeros(samplesOfDelay,1);

% Pad
w = [pad;x]; % delayed signal
x = [x;pad];

% Gain
g1 = 0.7;
g2 = 0.3;

x = x * g1;
w = w * g2;

% Plot
plot(x);
hold on
plot(w);
title('echo')
legend('signal','delay');

% Summing
y = x + w; % digital summing