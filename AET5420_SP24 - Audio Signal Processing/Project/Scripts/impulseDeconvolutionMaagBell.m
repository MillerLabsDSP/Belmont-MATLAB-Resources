%% impulseDeconvolutionMaagBell.m
% Zachary Miller, Alek Weidman, John Sweeney

% Deconvolution and null test
% 2 April 2024

clear; clc; close all;

[x,Fs] = audioread('logsweep - with fades.wav'); % dry sine sweep
y = audioread('Maag EQ4 (650Hz Bell -4dB) Sin Sweep.wav'); % sine sweep in room
y = y/max(y); % normalize, max(x) = max(y)

% Pad and collapse "y" to mono
pad = length(y)-length(x);
x = [x;zeros(pad,1)];
y = y(:,1);

X = fft(x); Y = fft(y);
lenX = length(X);

% Deconvolution
reg = 0.99; Nyq = Fs/2; Ts = 1/Fs;

H = zeros(lenX,1);
for k=1:lenX

    Xk = X(k,1); Yk = Y(k,1); conjXk = conj(Xk);
    H(k,1) = (conjXk * Yk) / ((conjXk * Xk + reg) * Ts);

end

[PTVocal_MaagBell] = audioread('Maag EQ4 (650Hz Bell -4dB) Vocal.wav');

h = real(ifft(H));
h = h/max(h); % normalize

% Null
vocal = audioread('Vocal.wav');
out = conv(vocal,h);
out = out(1:length(PTVocal_MaagBell));
out = out/(max(out)/max(PTVocal_MaagBell));
null = PTVocal_MaagBell - out;

plot(null); axis([0 length(out) -1 1]);
xlabel('Time'); ylabel('Amplitude');
title('Maag EQ4 650Hz Bell Cut IR Null Test');