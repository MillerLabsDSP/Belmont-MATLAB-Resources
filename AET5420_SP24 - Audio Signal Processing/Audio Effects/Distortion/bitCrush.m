%% bitCrush.m
% Simulation of bit reduction
% Zachary Miller
% 29 Jan 2024

clear; clc; close all;

% Input signal
% Fs = 48000;
% Ts = 1/Fs;
% t = [0:Ts:1-Ts].';
% f = 4;
% in = sin(2*pi*f*t);
[in,Fs] = audioread('AcGtr.wav');

N = length(in);
numBits = 2;
numAmpLevels = 2^numBits;
out = zeros(N,1);

% Dithering
% noise = randn(N,1) * 0.01; % synthesize white noise (dither)
% 
% in = in + noise; % add dither noise

for n=1:N
    x = in(n,1);
    xSmall = 0.5 * x + 0.5;
    xStretch = xSmall * numAmpLevels;
    yStretch = round(xStretch);
    ySmall = yStretch * (1/numAmpLevels);
    y = 2 * ySmall - 1;
    out(n,1) = y;
end

plot(out);

% Characteristic curve
% plot(in,in,in,out);

% THD
% thd(out);

% Playback
% sound(out,Fs);