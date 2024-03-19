%% realtimeConvolution.m
% Current and past samples known
% Zachary Miller
% 13 March 2024

clear; clc; close all;

x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2].';

test = conv(x,h); % test

M = length(h); % filter response length
buffer = zeros(M,1);
x = [x;zeros(M-1,1)]; % pad
N = length(x); % input length

out = zeros(N,1);
for n=1:N

    buffer = [x(n,1);buffer(1:end-1,1)];
    y = 0;
    for m=1:M
        y = y + buffer(m,1) * h(m,1);
    end

    out(n,1) = y;

end

[test,out]