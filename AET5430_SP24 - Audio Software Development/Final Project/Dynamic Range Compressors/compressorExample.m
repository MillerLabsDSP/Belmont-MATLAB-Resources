%% compressorExample.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

% Audio input signal
[in,Fs] = audioread('AcGtr.wav');

% Parameters for compressor
T = -15; % dBFS
R = 10;

% Initialize separate attack/release times
attackTime = 0.05; % in seconds
releaseTime = 0.25; % in seconds

% Compressor function
out = compressor(in,Fs,T,R,attackTime,releaseTime);

subplot(2,1,1); plot(in);
subplot(2,1,2); plot(out);
