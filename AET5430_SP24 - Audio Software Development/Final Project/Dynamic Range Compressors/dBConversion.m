%% dBConversion.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; close all;

% Simple input signal
% x = [-1:.01:1].';

% Sine input signal
Fs = 48000; Ts = 1/Fs;
t = [0:Ts:1-Ts].'; f = 5;
x = sin(2*pi*f*t);

N = length(x);
for n=1:N
    x_dB(n,1) = 20 * log10(abs(x(n,1))); % convert to dB
    if (x_dB(n,1) < -144) % Conditional prevents values
        x_dB(n,1) = -144; % of negative infinity/ below
    end                   % noise floor
end
plot(t*Fs,x_dB);
axis([0 Fs -60 0])
xlabel('Time (sec.)'); ylabel('Amplitude (dB)');