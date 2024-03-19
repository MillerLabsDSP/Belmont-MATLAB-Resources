%% irMeasurement.m
% Zachary Miller
% 12 Feb 2024

clear; clc; close all;

Fs = 48000;
x = [1;zeros(Fs,1)]; % impulse input signal
N = length(x);
h = zeros(N,1); % output array

d = 1000; % samples of delay
g = 0.5;

for n=1:N
    if (n-d < 1)
        h(n,1) = x(n,1);
    else
        h(n,1) = x(n,1) + g * h(n-d,1);
    end
end

% Plot "measured" impulse response
% stem(h);

% Convolve
[input,Fs] = audioread('monoViolin.wav');
y = conv(input,h);
plot(y);

% Use of reverb IR
[h1,Fs2] = audioread('reverbIR.wav');

hL = h1(:,1); % L channel of reverb
hR = h1(:,1); % R channel of reverb

% stem(hL); figure;
% stem(hR);

yL = conv(input,hL);
yR = conv(input,hR);

output = [yL,yR]; % stereo output signal
subplot(1,1,2)
plot(yL);
subplot(2,1,2)
plot(yR);