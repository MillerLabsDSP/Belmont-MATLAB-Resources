%% Homework 1 - Spring 2023
% distortionTest.m
% Use this script to test the operation of the function you create.  

close all;
clear; clc;

%% 
% Test signal used for each problem
Fs = 44100;
f = 2; % frequency is 2 hz
t = [0:1/Fs:1].'; % Time vector of samples
inputSignal = sin(2*pi*f.*t);  % Signal to be used as the input to each function
N = 44100;

%% Hard-clipping
% Write a function called hardClip.m
threshold = 0.7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
outputHC = hardClip(inputSignal,threshold);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); subplot(1,2,1);  plot(t,inputSignal,t,outputHC); title('Hard-clipping Effect');
subplot(1,2,2); plot(inputSignal,outputHC); title('Input vs. Output'); axis([-1 1 -1 1]);