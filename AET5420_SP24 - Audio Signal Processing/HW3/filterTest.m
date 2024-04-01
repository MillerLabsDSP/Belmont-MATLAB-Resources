%% filterTest.m
% Zachary Miller
% 29 March 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');

%% Bandpass

lowFreq = 3000;
highFreq = 16000;

% bandPassOutput = bandPass(x,Fs,lowFreq,highFreq);

%% Bandstop

lowFreq = 50;
highFreq = 15000;

bandStopOutput = bandStop(x,Fs,lowFreq,highFreq);

%% Listen

% sound(bandPassOutput,Fs);
% sound(bandStopOutput,Fs);