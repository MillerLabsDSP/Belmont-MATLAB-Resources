%% impulseDeconvolutionHardwareReverb.m
% Zachary Miller, Alek Weidman, John Sweeney

% 2 April 2024
% Deconvolution, RT60, and null test

clear; clc; close all;

[x,Fs] = audioread('logsweep - with fades.wav');
y = audioread('Lexicon 224X Concert Hall Sin Sweep.wav'); 
y = y/max(y); % normalize, max(y) = max(x)


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

[jake] = audioread('Lexicon 224X Concert Hall Vocal.wav');
jake = jake(:,1);

h = real(ifft(H));
h = h/max(h); % normalize

% RT60
N = length(H); Ts = 1/Fs; 
t = [0:Ts:(N/Fs)-Ts].'; % time domain (seconds)
plot(t,20*log10(abs(h))); hold on;
yline(-60); hold off; % RT60 threshold
axis([0 3 -85 0]);
legend('IR (dB)', 'RT60 threshold');
xlabel('Time (s)'); ylabel('Amplitude (dB)');
title('RT60: Lexicon 224X, "Concert Hall"');

% Null
vocal = audioread('Vocal.wav');
out = conv(vocal,h);
out = out(1:length(jake),1); % cut signal length
out = out/(max(out)/max(jake)); % extra normalization
null = jake - out;

figure;
plot(null); axis([0 length(jake) -1 1]);