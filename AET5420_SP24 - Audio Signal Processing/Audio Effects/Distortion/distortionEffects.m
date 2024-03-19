%% distortionEffects.m
% Zachary Miller
% 22 Jan 2024

clear; clc; close all;

% Sine wave input -> "fuzz effect" -> square wave output
Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:Ts:1-Ts].';
f = 2000;

% in = sin(2*pi*f*t); % full signal
[in,Fs] = audioread('stereoDrums.wav');
out = zeros(N,1);

% Process the samples of the sine wave input signal to create a square wave

% Infinite clipping
for n=1:N
    x = in(n,1); % one sample of signal "in"

    if (x > 0)
        y = 1;
    else
        y = -1;
    end

    out(n,1) = y;
end

% Half-wave rectification
% for n=1:N
%     x = in(n,1); % one sample of signal "in"
% 
%     if (x < 0)
%         y = 0;
%     else
%         y = x;
%     end
% 
%     out(n,1) = y;
% end

% Full-wave rectification
% for n=1:N
%     x = in(n,1); % one sample of signal "in"
% 
%     if (x < 0)
%         y = x*-1;
%     else
%         y = x;
%     end
% 
%     out(n,1) = y;
% end

% Cubic distortion/clipping
% for n=1:N
%     y(n,1) = x(n,1) - (1/3)*(x(n,1))^3;
% end

% Arctan distortion
% alpha = 5; % [1-10]

% for n=1:N
%     y(n,1) = (2/pi) * atan(alpha * x(n,1));
% end

% Waveform
% plot(t,in,t,out);
% axis([0 1 -1.1 1.1]);
% legend('Input','Output');

% Characteristic curve
% plot(in,in,in,out); axis([-1.1 1.1 -1.1 1.1]);

% Total Harmonic Distortion (THD) - @1kHz
% Level of the harmonics compared to the fundamental
% thd(out,Fs);