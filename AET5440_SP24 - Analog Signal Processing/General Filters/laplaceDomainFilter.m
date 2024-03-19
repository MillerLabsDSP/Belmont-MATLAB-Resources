%% laplaceDomainFilter.m
% 1st-order LPF

% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

% We are going to use MATLAB function: freqs()
% Similar to freqz()

%% Remember:
% H[z] = b0 + b1 z^-1 / a0 + a1 z^-1
% b = [b0 b1]
% a = [a0 a1]
% freqz(b,a)

%% Prototype filter
% % H(s) = 1 / (s+1)
% num = 1;
% den = [1,1];
% freqs(num,den);

%% Prototype with set cut-off
f = 100; % cut-off frequency (rad/sec) 
% num = f;
% den = [1,f];
% freqs(num,den);

% Range of frequencies
w = [10.1:0.1:1000];
H = f ./ (1j * w + f);

% subplot(2,1,1)
% loglog(w,abs(H)); % amplitude
% title('Amplitude')

% subplot(2,1,2)
% semilogx(w,angle(H)*180/pi); % phase
% title('Phase')

%% Low-pass filter circuit
R = 480e3; % resistance (Ohms)
C = 82e-12; % capacitance (pF)

% H(s) = 1 / (sRC + 1)
num = 1;
den = [R*C,1];
% freqs(num,den);

freq = [20:20000]; % cyc/sec
W = 2*pi*freq;     % rad/sec
[H,w] = freqs(num,den,W);

semilogx(w/(2*pi), 20*log10(abs(H))); % x-axis in Hz
axis([20,20000 -30 5])
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
