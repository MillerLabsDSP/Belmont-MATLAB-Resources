%% feedForwardDelay.m
% Implementation of multi-tap echo

% Zachary Miller
% 7 Feb 2024

clear; clc; close all;

[x,Fs] = audioread('AcGtr.wav');

N = length(x);

% Samples of delay
d1 = 12000;
d2 = 24000;

g1 = 0.6;
g2 = 0.3;
g3 = 0.1;

y = zeros(N+d,1);

% for n=1:N+d
%     if (n-d < 1)
%         y(n,1) = g1 * x(n,1);
%     elseif (n-d2 <1)
%         y(n,1) = g1 * x(n,1) + g2 * x(n-d1,1);
%     else
%         y(n,1) = g1 * x(n,1) + g2 * x(n-d1,1) + g3 * x(n-d2,1);
%     end
% end

plot(y);