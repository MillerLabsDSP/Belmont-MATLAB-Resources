%% stateSpaceTemplate.m
% Zachary Miller
% 20 March 2024

clear; clc; close all;

% Resistor and capacitor values
R1 = []; % (Ohms)
R2 = [];
R3 = [];
C1 = []; % (nFs)
C2 = [];
C3 = [];

% State-space form
A = [];
B = [];
C = [];
D = [];

% Continuous-time TF
[bc,ac] = ss2tf(A,B,C,D);
w = 2*pi*[20:20000]; % freq in cyc/sec to freq in rad/sec
[Hc,Wc] = freqs(bc,ac,w);
semilogx(Wc/(2*pi),20*log10(abs(Hc))); 
axis([20 20000 -15 6]); xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');