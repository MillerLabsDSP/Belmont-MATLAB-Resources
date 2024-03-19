%% filterExample.m
% Zachary Miller
% 1 March 2024

% Hack Audio (Ch. 13)

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');
Nyq = Fs/2;

m = 4; % filter order

freqHz = [500 2000]; % bandpass
Wn = freqHz ./ Nyq;

[b,a] = butter(m,Wn,'bandpass');
y = filter(b,a,x);

subplot(2,1,1); plot(x);
subplot(2,1,2); plot(y);