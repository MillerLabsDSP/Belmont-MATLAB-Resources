%% ADSREXAMPLE.M
% This script creates a linear ADSR amplitude envelope
%
% From Hack Audio (Ch. 17)

clear; clc; close all;

% Number of samples per fade
a = 20;
d = 20;
s = 70;
r = 40;

sustainAmplitude = 0.75;

% Create each segment (ADSR)
aFade = linspace(0,1,a)';
dFade = linspace(1,sustainAmplitude,d)';
sFade = sustainAmplitude * ones(s,1);
rFade = linspace(sustainAmplitude,0,r)';

env = [aFade;dFade;sFade;rFade];
plot(env);