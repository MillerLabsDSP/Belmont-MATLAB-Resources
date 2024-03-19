%% invertingAmplifierSim.m
% Zachary Miller
% 15 Feb 2024

clear; clc; close all;

% Resistors
R1 = 1000; % Ohms
R2 = 2000;

% System of equations matrix
A = [1/R1 -1/R1 0 1 0; ...
    -1/R1 (1/R1 + 1/R2) -1/R2 0 0; ...
    0 -1/R2 1/R2 0 1; ...
    0 1 0 0 0; ...
    1 0 0 0 0];

invA = inv(A); % inverse

Fs = 48000;
Ts = 1/Fs;
f = 3;
t = [0:Ts:1-Ts].';
in = sin(2*pi*f*t);

N = length(in);
out = zeros(N,1);
b = zeros(5,1);

for n=1:N

    % Ax = b
    % x = A^-1 * b

    b(5,1) = in(n,1); % last val of "b" equal to input voltage/sample amp
    x = invA * b; % "x" (5x5)
    out(n,1) = x(3,1); % output equal to val from TF

end

plot(t,in,t,out); % plot  input over output