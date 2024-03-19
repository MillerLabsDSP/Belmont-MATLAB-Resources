%% pitchDetectionZCR.m
% Zachary Miller
% 20 Nov 2023
% AET5410

clear; clc;

% Synthesize test signal
% Fs = 48000;
% Ts = 1/Fs;
% t = [0:Ts:1-Ts].';
% f = 10;
% x = cos(2*pi*f*t);
% N = length(x);
% plot(t,x);

% Read in test signal file
[x,Fs] = audioread('testSignal.wav');
N = length(x);

% Set buffer and 50% ZCR overlap
bufferSize = 512;
overlap = bufferSize * 0.5;

% Initialize first buffer window
bufferStart = 2; bufferEnd = bufferSize;

% Zero pad irregular signal (dependent on equal division by buffer size)
if (mod(N,bufferSize) ~= 0)

    zerosNeed = (ceil(N / bufferSize) * bufferSize) - N;
    x = [x;zeros(zerosNeed,1)];
    N = length(x);
    numFrames = N / overlap - 1;

else

    numFrames = N / overlap - 1;

end

% Initialize array for pitch values/variable for zeroCrossings counter
pitch = zeros(numFrames,1);
zeroCrossings = 0;


% Zero-crossing rate (ZCR)
for i=1:numFrames
    for n=bufferStart+1:bufferEnd
        if (x(n-1,1) < 0 && x(n,1) >= 0 || x(n-1,1) > 0 && x(n,1) <= 0)
            zeroCrossings= zeroCrossings + 1;
        end
        x(n-1,1) = x(n,1);
    end 

    % Convert zeroCrossings count per buffer to frequency
    zeroCrossingsPerSecond = zeroCrossings * Fs/bufferSize;
    cyclesPerSecond = zeroCrossingsPerSecond / 2;
    pitch(i) = cyclesPerSecond;
    
    % Switch to new overlappepd buffer, reset zero crossings counter
    bufferStart = bufferStart + overlap;
    bufferEnd = bufferEnd + overlap;
    zeroCrossings = 0;

end

plot(pitch);