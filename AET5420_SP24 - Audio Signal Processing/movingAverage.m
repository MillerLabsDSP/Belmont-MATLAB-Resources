%% movingAverage.m
% From KnowledgeAmplifier's MATLAB DSP series

% Zachary Miller
% 16 April 2024

clc; clear; close all;

% Input sine signal
Fs = 480;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 5;
x=sin(2*pi*f*t);

% Add noise to signal
N = length(x);

a = -1;
b = 1;
n = (b-a).*rand(N,1) + a;

x = x + n;

% Window function with filter num/den params
a = 20; % size of window
t2 = ones(1,a);
num = (1/a)*t2;
den = [1];

% Filter/plot signal
y = filter(num,den,x);
plot(x,'b');
hold on;
plot(y,'r','linewidth',2);
legend('Noisy signal','Filtered signal');