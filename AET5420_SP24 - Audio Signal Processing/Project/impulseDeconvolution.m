%% impulseDeconvolution.m
% Zachary Miller
% 30 March 2024

clear; clc; close all;

[x,Fs] = audioread('logsweep - with fades.wav');
y = audioread('REW Studio A Measurements 6ft - 2.wav');

pad = length(y)-length(x);
x = [x;zeros(pad,1)]; % zero pad
y = y(:,1); % collapse to mono

X = fft(x); Y = fft(y);
lenX = length(X);

reg = 0.1; Nyq = Fs/2; Ts = 1/Fs;

H = zeros(length(X),1);
for k=1:lenX

    Xk = X(k,1); Yk = Y(k,1); conjXk = conj(Xk);
    H(k,1) = (conjXk * Yk) / ((conjXk * Xk + reg) * Ts);

end

h = real(ifft(H));
h = h/min(h); % normalize
plot(h); axis([0 lenX -1 1]);

% Listen
vocal = audioread('Vocal.wav');
out = conv(vocal,h);
sound(out,Fs);
