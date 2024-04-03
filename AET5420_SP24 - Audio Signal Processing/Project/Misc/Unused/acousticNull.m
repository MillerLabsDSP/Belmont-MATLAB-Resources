%% acousticNull.m
% Zachary Miller, Alek Weidman, John Sweeney
% 2 April 2024

clear; clc; close all;

% Impulse responses
[deconv,Fs] = audioread('vocalWithDeconvIR.wav');
[jakeREM] = audioread('Day 2 Jake - 2.wav');

N = length(deconv);
deconv = deconv(1:N/2);

M = length(jakeREM) - length(deconv);
pad = zeros(M,1);
jakeREM = jakeREM(:,1); % make mono
deconv = [deconv;pad]; % pad

N = length(deconv);

% subplot(2,1,1); plot(deconv); axis([0 N -1 1]);
% subplot(2,1,2); plot(jakeREM); axis([0 N -1 1]);

nullAcoustic = deconv - jakeREM; 
plot(nullAcoustic); title('Acoustic Null Test');
axis([0 N -1 1]);
