%% midtermTest.m
% Zachary Miller
% 28 Feb 2024

% Feel free to ignore this, just for scratchin' :)

clear; clc; close all;

% Input (impulse)
Fs = 48000; Ts = 1/Fs;
t = [0:Ts:1-Ts].';
x = [1;zeros(47999,1)]; % 1 seconds
N = length(x);

% % Delays
% d1 = 14400;
% d2 = 19200;
% 
% % Gains
% g1 = 0.6;
% g2 = 0.5;

y = zeros(N,1);

% % Difference equation
% for n=1:N
%     if (n-d1 < 1)
%         y(n,1) = x(n,1);
%     elseif (n-d2 < 1)
%         y(n,1) = x(n,1) + (g1 * y(n-d1,1));
%     else
%         y(n,1) = x(n,1) + (g1 * y(n-d1,1)) + (g2 * y(n-d2,1));
%     end
% end

% Delay lengths in samples
delayLenSamples1 = 14400;
delayLenSamples2 = 19200;

% Buffers
buffer1 = zeros(delayLenSamples1,1);
buffer2 = zeros(delayLenSamples2,1);

% Delay schematic parameters
g1 = 0.6; % gain
g2 = 0.5;

for n=1:N
    w = buffer1(end,1); % index last sample of delay buffer
    v = buffer2(end,1); % " "

    y(n,1) = x(n,1) + g1 * w + g2 * v; % compute
    
    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    buffer2 = [y(n,1);buffer2(1:end-1,1)];
end

stem(t,y); sound(y,Fs);
axis([0 1 0 1])