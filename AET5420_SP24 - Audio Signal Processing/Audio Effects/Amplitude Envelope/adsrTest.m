%% adsrTest.m
% Zachary Miller

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 100;

x = sin(2*pi*f*t);
y = adsr(x,Fs,50,20,0.75,40);

% Listen to output
sound([x;zeros(48000,1);y],Fs);