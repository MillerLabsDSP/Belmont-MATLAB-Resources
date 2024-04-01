%% BPF2StateSpace.m
% Zachary Miller
% 20 March 2024

% 2nd-order BPF

clear; clc; close all;

% Resistor and capacitor values
R1 = 10^6; % (Ohms)
R2 = 6^6;
C1 = 10^-9; % (nFs)
C2 = 10^-9;

% State-space form
A = [(-1/(R1*C1))+(-1/(R2*C1)),(-1/(R2*C1));(-1/(R2*C2)),(-1/(R2*C2))];
B = [(1/(R1*C1))+(1/(R2*C1));(1/(R2*C2))];
C = [0, 1];
D = [0];

% Continuous-time TF
[bc,ac] = ss2tf(A,B,C,D);
w = 2*pi*[20:20000]; % freq in cyc/sec to freq in rad/sec
[Hc,Wc] = freqs(bc,ac,w);
semilogx(Wc/(2*pi),20*log10(abs(Hc))); 
axis([20 20000 -15 6]); xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');