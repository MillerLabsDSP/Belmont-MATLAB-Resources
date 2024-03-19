%% pitchAutoCorr.m
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
bufferSize = 2048;
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

pitch = zeros(numFrames,1);

% Auto-correlation
for i=1:numFrames 
    [val,ind] = findpeaks(xcorr(x(bufferStart:bufferEnd))); % Find peaks of auto-correlated signal (and their values/indices)
    midpoint = ceil(length(ind)/2); % Find midpoint (largest peak) of signal
    if (midpoint==0) % Index for silence
        pitch(i) = 0;
    else
        % Reassess midpoint with algorithm that accounts for auto-correlated 
        % signals that have unequal numbers of peaks detected near zero that 
        % skew the original midpoint formula. New algorithm finds index of
        % the maximum peak value and then finds its respective index.
        maxVal = max(val);  
        midpoint = find(val == maxVal);
        period = ind(midpoint) - ind(midpoint-1);
        pitch(i) = Fs / period;
    end
% Reset for new buffers
bufferStart = bufferStart + overlap;
bufferEnd = bufferEnd + overlap;
end

plot(pitch);
axis([0 numFrames 0 pitch(i)+100]);