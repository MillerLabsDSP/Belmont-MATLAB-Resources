%% RMSTest.m
% Zachary Miller
% 25 Feb 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');
M = 512;

y = rmsPlot(x,M);