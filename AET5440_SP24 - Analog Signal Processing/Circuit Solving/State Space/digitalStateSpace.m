%% digitalStateSpace.m
% Zachary Miller
% 15 Feb 2024

clear; clc; close all;

% LPF
b = fir1(2,0.5);
b0 = b(1,1);
b1 = b(1,2);
b2 = b(1,2);

% Initialize states
x1 = 0;
x2 = 0;

N = 48000;
u = 0.2 * randn(N,1);
out = zeros(N,1);

for n=1:N

    out(n,1) = b0*u(n,1) + b1*x1 + b2*x2;
    x2 = x1;
    x1 = u(n,1);

end