%% linAmpPlotTest.m

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');
% x = x / max(x); % make input peak at 1

linAmpPlot(x,Fs);