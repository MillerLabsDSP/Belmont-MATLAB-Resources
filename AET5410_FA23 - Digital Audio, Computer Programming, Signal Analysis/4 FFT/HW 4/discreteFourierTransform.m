%% discreteFourierTransform.m
% Zachary Miller
% AET5410
% HW4 #1

clear; clc; close all;

[x,Fs] = audioread('sawtoothwave.wav'); % x[n]
Ts = 1/Fs;
StopTime = 0.25;
t = [0:Ts:StopTime-Ts]';
N = length(x); % length of signal

% Initialize storage matrix
p = zeros(N,N);

% Less efficient method
% for n=1:N
%     for k=0:N-1
%         wk = k*(2*pi/N)*Fs;
%         p(k+1,n) = cos(wk*t(n)) - sin(wk*t(n)) * 1i;
%     end
% end

% Load values from periodic signals into p matrix
for k=0:N-1
    wk = k*2*pi*Fs/N;
    p(:,k+1) = cos(wk*t) - sin(wk*t) * 1i;
end

% Discrete Fourier Transform
X = p*x; % mine
check = fft(x); % native

% Null test
null = check - X; % difference
plot(t,null);
title('Null difference test')
axis([0 StopTime -0.01 0.01]);