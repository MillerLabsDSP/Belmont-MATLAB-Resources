%% ProCoRAT_ToneControl_DiscreteKirchhoff.m
% Zachary Miller
% 7 April 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;

C1 = 3.3e-9;
R1 = Ts/(2*C1);
tonePot = 1;
R2 = (1-tonePot) * 1e5;
R3 = tonePot * 1e5;
R4 = 1500;

G = ((R2+R3+R4)/R1) + 1;

b0 = 1/G;
b1 = (R3+R4)/G;

u = [1;zeros(2047,1)];
N = length(u);
y = zeros(N,1);

x1 = 0;
for n=1:N

    % Difference equations
    Vin = u(n,1);
    Vout = b0*Vin + b1*x1;
    
    % State updates
    x1 = (2/R1) * Vout - x1;
    y(n,1) = Vout;

end

[H,W] = freqz(y,1,N,Fs);
semilogx(W,20*log10(abs(H)));
title('Pro Co RAT Guitar Pedal - Tone Control Circuit Model');
subtitle('State Space - Discrete Kirchhoff Method')
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');
axis([20 20000 -50 5]);