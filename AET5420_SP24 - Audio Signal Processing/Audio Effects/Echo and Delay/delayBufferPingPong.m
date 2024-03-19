%% delayBufferPingPong.m
% Zachary Miller
% 21 Feb 2024

clear; clc; close all;

% Input
% x = [1;zeros(20,1)];
[x,Fs] = audioread('click60.wav');
N = length(x);
x = [x(1:24000);zeros(N,1)];

% Buffer initialization
% delayLenSamples1 = Fs/4;
% delayLenSamples2 = Fs/2;
delayLenSamples1 = 12000;
delayLenSamples2 = 24000;
delayLenSamples3 = 36000;
buffer1 = zeros(delayLenSamples1,1);
buffer2 = zeros(delayLenSamples2,1);
buffer3 = zeros(delayLenSamples2,1);

% Delay schematic parameters
wet = 50;
g1 = 0.8;
g2 = 0.6;
g3 = 0.4;
g4 = 0.2;

y = zeros(N,2);

% Without tail
for n=1:N
    w = buffer1(end,1); % index last sample of delay buffer
    v = buffer2(end,1);
    u = buffer3(end,1);
    y(n,1) = (wet * x(n,1)) + (1-wet) * (g2 * w + g3 * v); 
    y(n,2) = (wet * x(n,1)) + (1-wet) * (g3 * v + g4 * u);
    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    buffer2 = [y(n,1);buffer2(1:end-1,1)];
    buffer3 = [x(n,1);buffer3(1:end-1,1)];
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