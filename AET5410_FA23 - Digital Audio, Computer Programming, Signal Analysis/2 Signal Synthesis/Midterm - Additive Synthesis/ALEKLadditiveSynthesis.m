% Alek Weidman
% Midterm Coding Question

clear; clc;

Fs = 48000; % Sampling rate
Ts = 1 / Fs; % Sampling Period
N = 48000; % Length of signal
t = [0:N-1]' * Ts; % Need the brackets here for the transposition
f = 50; % Starting frequency

M = floor(Fs / (2 * f)); % 240

multiVar = 1; % The denominator variable

sawTooth = zeros(N,1); % Allocating for our sawtooth array

for i = 1:M

    x = sin(2 * pi * f * t); % Audio Signal
    sawTooth = sawTooth + ((1/multiVar) * sin(x)); % Summing the current harmonic to the past harmonics
    f = f + 100; % increasing the frequecny each interation: 100, 200, 300, etc.
    multiVar = multiVar + 1; % increasing the denominator after each loop: 1/1, 1/2, 1/3, etc.

end

sawTooth = sawTooth * (2 / pi); % Multiples the 2 / pi to the summed signal

plot(t,sawTooth)
%audiowrite('sawtooth.wav',sawTooth,Fs);