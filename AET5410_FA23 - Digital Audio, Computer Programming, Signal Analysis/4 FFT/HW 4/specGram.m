%% specGram.m
% Zachary Miller
% AET5410
% HW4 #3

clear; clc; close all;

% Read in test signal file
[x,Fs] = audioread('testSignal.wav');
Ts = 1/Fs;
N = length(x);
Nyq = Fs/2; % Nyquist

% Set buffer and 50% ZCR overlap
bufferSize = 512;
win = hann(bufferSize); % window function
overlap = bufferSize * 0.5;

% Initialize first buffer window
bufferStart = 1; bufferEnd = bufferSize;

% Zero pad irregular signal (dependent on equal division by buffer size)
if (mod(N,bufferSize) ~= 0)
    zerosNeed = (ceil(N / bufferSize) * bufferSize) - N;
    x = [x;zeros(zerosNeed,1)];
    N = length(x);
    numFrames = N / overlap - 1;
else
    numFrames = N / overlap - 1;
end

% FFT with window function
for i=1:numFrames
    if (bufferEnd <= N)
        y(:,i) = fft(win.*x(bufferStart:bufferEnd));
    end
    bufferStart=bufferStart+overlap;
    bufferEnd=bufferEnd+overlap;
end

% Initialize time and frequency axes
tScale = N/Fs;
fScale = Fs/bufferSize;

% Scale time and frequency
T = 0:tScale/(numFrames-1):tScale;
F = 0:fScale:Fs-1;

% Plot
surf(T,F,abs(y)); % plot
xlabel('Time (s)'), ylabel('Frequency (Hz)'), zlabel('Amplitude')
shading interp;