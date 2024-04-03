%% impulseDeconvolutionMaagShelf.m
% Zachary Miller, Alek Weidman, John Sweeney

% 2 April 2024
% Deconvolution and null test

clear; clc; close all;

[x,Fs] = audioread('logsweep - with fades.wav');
y = audioread('Maag EQ4 (20kHz High Shelf +6dB) Sin Sweep.wav');
y = y/max(y); % max(x) = max(y)

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

    Xk = X(k,1); 
    Yk = Y(k,1); 
    conjXk = conj(Xk);
    H(k,1) = (conjXk * Yk) / ((conjXk * Xk + reg) * Ts);

end

[PTVocal_Maag20kHz] = audioread('Maag EQ4 (20kHz High Shelf +6dB) Vocal.wav');

h = real(ifft(H));
h = h/max(h); % normalize

% Null
vocal = audioread('Vocal.wav');
out = conv(vocal,h);
out = out(1:length(PTVocal_Maag20kHz));
out = out/(max(out)/max(PTVocal_Maag20kHz)); % extra normalization
null = PTVocal_Maag20kHz - out;

plot(null); axis([0 length(out) -1 1]);
xlabel('Time'); ylabel('Amplitude');
title('Maag EQ4 20kHz High Shelf IR Null Test');