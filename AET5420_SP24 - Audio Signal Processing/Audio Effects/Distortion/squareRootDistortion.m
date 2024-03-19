%% squareRootDistortion
% From AET5420 - Quiz 1
% Zachary Miller
% 5 Feb 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
N = 48000;
f = 10;

in = sin(2*pi*f*t);
% [in,Fs] = audioread('AcGtr.wav');
out = zeros(N,1);

for n=1:N
    x = in(n,1);
    if x > 0
        y = sqrt(x);
    elseif x < 0
        y = -sqrt(abs(x));
    else
        y = x;
    end
    out(n,1) = y;
end

% Waveform plot
% plot(t,in,t,out);
% title('Sinewave waveform')

% Characteristic curve
plot(in,in,in,out);
title('Characteristic Curve')

% Total harmonic distortion (THD) plot
% thd(out,Fs);