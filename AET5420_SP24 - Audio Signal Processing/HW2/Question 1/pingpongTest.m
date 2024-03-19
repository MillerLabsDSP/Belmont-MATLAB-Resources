%% pingpongTest.m

clear; clc; close all;

% Import a test file
[in,Fs] = audioread('click60.wav');
% [in,Fs] = audioread('click89.wav');
N = length(in);

in = [in(1:1000);zeros(160000,1)]; % single click

% Input variables
BPM = 60; % This should match the name of the sound file
note = 0.25; % 4 = whole, 2 = half, 1 = quarter, 0.5 = 8th, 0.25 = 16th
feedback = 50; % Percentage [0,100]
wet = 50; % wet/dry

% Call the function
[out] = pingpong(in,Fs,BPM,note,wet,feedback);

% Listen to the output to see if it worked
% sound(out,Fs); 
plot(out);

%% NOTE: 
% For the block diagram, delay block "z^-d3" is assumed as a 
% 1 second delay (or equal to the Fs of the input).