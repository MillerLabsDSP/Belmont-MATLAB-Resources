%% tiltEQTest.m
% Zachary Miller
% 27 March 2024

clear; clc; close all;

[input,Fs] = audioread('AcGtr.wav');

tilt = 2; % dB

y = tiltEQ(input,Fs,tilt);
% sound(y,Fs); % listen to filter