%% s2LPF.m
% 2nd-order low-pass Butterworth filter

% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

%% Low-pass filter circuit
R = 480e3; % resistance (Ohms)
C = 82e-12; % capacitance (pF)

% H(s) = 1 / (sRC + 1)
num = 1;
den = [(R*C)^2,2*(R*C),1];

freq = [20:20000]; % cyc/sec
W = 2*pi*freq;     % rad/sec
[H,w] = freqs(num,den,W);

% Plot
semilogx(w/(2*pi), 20*log10(abs(H))); % x-axis in Hz
axis([20,20000 -30 5])
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')