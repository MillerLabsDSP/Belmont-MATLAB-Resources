% signalSynthesisNoise
% Zachary Miller
% DATE N/A

clear; clc;

Fs = 20;                        % Sample rate
dt = 1/Fs;                      % Sample period
Fc = 5;                         % Frequency
t = (1/Fc) * (0:dt/Fc:1-dt);    % Time domain (single cycle)

sw = sin(2*pi*Fc*t);
noise = 0.1 * randn(size(sw));
swWithNoise = sw + noise;

plot(t,swWithNoise,'r');
hold on;
plot(t,sw,'k');

sound(swWithNoise);