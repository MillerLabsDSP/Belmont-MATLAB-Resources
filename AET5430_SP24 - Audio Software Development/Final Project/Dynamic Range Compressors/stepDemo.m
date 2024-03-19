%% stepDemo.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; close all;

Fs = 48000; Ts = 1/Fs;

% Step input signal
x = [zeros(Fs,1);ones(Fs,1)];
N = length(x);

% Initialize gain value
alpha = 0.9995; % [0.999 - 0.9999]
q = 0; % feedback variable

for n=1:N
    y(n,1) = (1-alpha) * x(n,1) + alpha * q;
    q = y(n,1);
end

t = [0:N-1]*Ts;
plot(t,x,t,y);
axis([0 2 -0.1 1.1]); xlabel('Time (sec)');
legend('Step Input','Output');

%% Note:
% Built-in MATLAB function
% y = stepz(b,a)
% b = [1-alpha]
% a = [1.-alpha]