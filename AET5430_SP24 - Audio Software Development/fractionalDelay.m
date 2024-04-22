%% fractionalDelay.m
% Zachary Miller
% 19 April 2024

% Test script for Dr. Tarr's FractionalDelay processSample() function
    % Single-channel version

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;

x = [1;zeros(Fs-1,1)];
% x = linspace(1,5000).';
N = length(x);

tau = 2*pi;

depth = 1;
speed = 0; % Hz
delay = 10;

currentAngle = 0;
angleChange = speed * Ts * tau;

index = 1;
MAX_BUFFER_SIZE = 96000;

delayBuffer = zeros(MAX_BUFFER_SIZE,1); out = zeros(N,1); 
for n=1:N

    lfo = depth * sin(currentAngle);
    
    currentAngle = currentAngle + angleChange;
    if (currentAngle > tau)
        currentAngle = currentAngle - tau;
    end
    
    % Delay buffer
    % "delay" can be fraction
    
    d1 = floor(delay+lfo);
    d2 = d1 + 1;
    g2 = delay + lfo - d1;
    g1 = 1.0 - g2;
    
    indexD1 = index - d1;
    if (indexD1 < 1)
        indexD1 = indexD1 + MAX_BUFFER_SIZE;
    end
    
    indexD2 = index - d2;
    
    if (indexD2 < 1)
        indexD2 = indexD2 + MAX_BUFFER_SIZE;
    end
    
    y = g1 * delayBuffer(indexD1,1) + g2 * delayBuffer(indexD2,1);
    
    delayBuffer(index) = x(n,1);
    
    if (index < MAX_BUFFER_SIZE + 1)
        index = index + 1;
    else
        index = 1;
    end
    
    out(n,1) = y;

end

plot(out);