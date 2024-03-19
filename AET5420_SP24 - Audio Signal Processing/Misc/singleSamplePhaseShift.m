%% singleSamplePhaseShift.m
% Zachary Miller
% 18 March 2024

clear; clc; close all;

% f cycles / sec * 1sec / Fs samples * 2pi rad / 1 cycle = x rad / 1 sample
% f cycles / sec * 1sec / Fs samples * 360 deg / 1 cycle = x deg / 1 sample

Fs = 48000;
Nyq = Fs/2;

% f = 20;
% degShift = f * 360 / Fs; % degrees of phase shift
% radShift = f * (2*pi) / Fs;

% f = 1000;
% degShift = f * 360 / Fs;
% radShift = f* (2*pi) / Fs;

f = Nyq;
degShift = f * 360 / Fs;
fprintf('24000Hz introduces %d degrees of phase shift.\n', degShift);
% radShift = f* (2*pi) / Fs;