%% lowShelfStateSpace.m
% Zachary Miller
% 19 March 2024

clear; clc; close all;

R2 = 4000; % potential for potentiometer
R3 = 1000;
C1 = 1*10^-6;

% State-space form
A = -1/(R2*C1);
B = 1/(R3*C1);
C = -1;
D = 1;

% Continuous-time TF
[bc,ac] = ss2tf(A,B,C,D);
w = 2*pi*[20:20000]; % freq in cyc/sec to freq in rad/sec
[Hc,Wc] = freqs(bc,ac,w);
semilogx(Wc/(2*pi),20*log10(abs(Hc))); 
axis([20 20000 -5 15]);