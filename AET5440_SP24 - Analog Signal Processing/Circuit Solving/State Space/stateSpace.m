%% stateSpace.m
% Zachary Miller
% 21 Feb 2024

clear; clc; close all;

% 1st-order digital LPF
[b,a] = butter(1,0.25);
b0 = b(1)
b1 = b(2)
a1 = a(2)

u = [1;zeros(511,1)]; % impulse
y = filter(b,a,u);
freqz(y);

% State-space form
A = [0 0; b1 -a1];
B = [1; b0];
C = [b1 -a1];
D = b0;

% State update
x = [0; 0]; % [x1,x2] column vector
N = length(u);

% Filtering using a loop
for n=1:N
    y(n,1) = C * x + D * u(n,1);
    x = A * x + B * u(n,1);
end

figure
freqz(y);