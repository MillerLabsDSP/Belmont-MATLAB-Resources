% phaseSynthesis.m
% Zachary Miller
% 23 Oct 2023

clear; clc;

Fs = 48000;

N = 2*length(Fs);

% angleChange = f * 2 * pi / Fs;

f = linspace(200,20,N)';

% Initialize/starting phase
phase = 0;

x(n,1) = sin(phase);
for n=1:N
    angleChange = f(n,1) * 2 * pi / Fs;
    phase = phase + angleChange;

    if (phase > (2*pi))
        phase = phase - (2*pi);
    end
end

sound(x,Fs);
plottf(x,Fs);