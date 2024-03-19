%% midSideProcessing.m
% Zachary Miller
% 17 Jan 2024

clear; clc; close all;

[x,Fs] = audioread('stereoDrums.wav');

L = x(:,1);
R = x(:,2);

% Encoding
side = L-R; % difference
mid = L+R; % sum signal

% Stereo widening
width = 1; % [0-2]
newSide = width * side;
newMid = (2-width) * mid;

% Decoding
L = (1/2) * (newMid + newSide);
R = (1/2) * (newMid - newSide);

% New stereo signal
y = [L,R];

% Null test
z = (x * -1) + y;
% plot(z);

% Goniometer
goniometer(y);