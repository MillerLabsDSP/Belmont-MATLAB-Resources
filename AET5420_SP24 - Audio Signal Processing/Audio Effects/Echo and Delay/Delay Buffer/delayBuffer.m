%% delayBuffer.m
% Zachary Miller
% 21 Feb 2024

clear; clc; close all;

% Input
% x = [1;zeros(9,1)];
[x,Fs] = audioread('click60.wav');
N = length(x);

% Buffer initialization
% delayLenSamples1 = Fs/4;
% delayLenSamples2 = Fs/2;
delayLenSamples1 = 2;
delayLenSamples2 = 7;
buffer1 = zeros(delayLenSamples1,1);
buffer2 = zeros(delayLenSamples2,1);

% Delay schematic parameters
g1 = 0.6; % wet/dry
g2 = 0.4;
g3 = 0.5;

y = zeros(N,1);

% Without tail
for n=1:N
    w = buffer1(end,1); % index last sample of delay buffer
    v = buffer2(end,1);
    y(n,1) = g1 * x(n,1) + g2 * w + g3 * v; % w is output of buffer before g2
    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    buffer2 = [y(n,1);buffer2(1:end-1,1)]; % feeds back into buffer 1
end

% With tail
% for n=1:2*N
%     w = buffer(end,1); % index last sample of delay buffer
%     v = buffer2(end,1);
%     if (n <= N)
%         y(n,1) = g1 * x(n,1) + g2 * w + g3 * v; % w is output of buffer before g2
%         buffer = [x(n,1);buffer(1:end-1,1)];
%     else
%         y(n,1) = g2 * w + g3 * v;
%     end
%     buffer2 = [y(n,1);buffer2(1:end-1,1)];
% end

sound(y,Fs);
plot(y);