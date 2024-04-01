%% MLMBPcomp_rmsParallelCompTest.m
% Zachary Miller
% 4 March 2024

clear; clc; close all;

% Audio input signal
[x,Fs] = audioread('AcGtr.wav');
N = length(x);

% Compressor parameters
T = -12; % threshold (dBFS)
R = 4; % ratio (R:1)
W = 4; % knee

% Parallel compression
blend = 10; % [0-100]

% Attack/release times
attackTime = 0.1;
releaseTime = 0.25;

% Call function
[y] = MLMBPcomp_rmsParallelComp(x,Fs,T,R,W,attackTime,releaseTime,blend);