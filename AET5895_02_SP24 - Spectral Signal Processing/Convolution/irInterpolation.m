%% irInterpolation.m
% Zachary Miller
% 17 March 2024

clear; clc; close all;

[offAxis,Fs] = audioread('Mesa Stiletto SM57 Off-Axis.wav');
[onAxis] = audioread('Mesa Stiletto SM57 On-Axis.wav');
onAxis = [onAxis;zeros(length(offAxis)-length(onAxis),1)];


% Time-domain interpolation
mix = 0.5;

ir = (1-mix) * onAxis + mix * offAxis;

stem(onAxis); hold on;
stem(offAxis); hold on;
stem(ir); hold off;
axis([0 20 -1 1]);

% Result in the frequency-domain
[Hon,W] = freqz(onAxis,1,2048,Fs);
[Hoff,W] = freqz(offAxis,1,2048,Fs);
[Hir,W] = freqz(ir,1,2048,Fs);

plot(W,20*log10(abs(Hon))); hold on;
plot(W,20*log10(abs(Hoff))); hold on;
plot(W,20*log10(abs(Hir))); hold off;
axis([20 20000 -80 25]); % scale