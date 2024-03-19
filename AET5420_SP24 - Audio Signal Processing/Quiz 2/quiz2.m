%% quiz2.m
% AET5420
% Zachary Miller
% 26 Feb 2024

clear; clc; close all;

% Input (impulse)
Fs = 48000;
Ts = 1/Fs;
in = [1;zeros(191999,1)]; % 4 seconds
N = length(in);

% Delay lengths in samples
delayLenSamples1 = Fs/2;
delayLenSamples2 = (3*Fs)/4;
delayLenSamples3 = Fs;

% Buffers
buffer1 = zeros(delayLenSamples1,1);
buffer2 = zeros(delayLenSamples2,1);
buffer3 = zeros(delayLenSamples3,1);

% Delay schematic parameters
g1 = 0.9; % gain
g2 = 0.8;
g3 = 0.5;

out = zeros(N,1);

for n=1:N
    w = buffer1(end,1); % index last sample of delay buffer
    v = buffer2(end,1); % " "
    u = buffer3(end,1); % " "

    out(n,1) = in(n,1) + g1 * w + g2 * v + g3 * u; % compute
    
    buffer1 = [in(n,1);buffer1(1:end-1,1)];
    buffer2 = [in(n,1);buffer2(1:end-1,1)];
    buffer3 = [out(n,1);buffer3(1:end-1,1)];
end

% for n=1:N
%     if (n-d < 1)
%         out(n,1) = in(n,1);
%     else
%         out(n,1) = g1 * in(n-d,1) + g2 * out(n,1);
% 
%     end
% end

stem(out);
axis([0 48000*4 0 1])