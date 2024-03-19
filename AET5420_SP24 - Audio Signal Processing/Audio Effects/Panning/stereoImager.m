%% stereoImager.m
% Zachary Miller
% 17 March 2024

% From Hack Audio (Ch. 9)

% clear; clc; close all;

% [in,Fs] = audioread('stereoDrums.wav');
in = [0.5*ones(10,1),0.3*ones(10,1)];

% Splitting signal into left and right channels
L = in(:,1);
R = in(:,2);

% Create mid and side channels
mid = 0.5 * (L+R);
side = 0.5 * (L-R);

% Width amount
width = 1.5; % wider when > 1, narrower when < 1

% Scale the mid/side with width
midNew = (2-width) .* mid;
sideNew = width .* side;

% Create new M/S signal
newLeft = midNew + sideNew;
newRight = midNew - sideNew;

% Combine signals
out = [newLeft,newRight];
% sound(out,Fs);