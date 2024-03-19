%% userCorrelation.m
% Zachary Miller
% Class example

clear; clc; close all;

x = [2; -1; 1; -2; 4];
y = [1; 3; -2; -1; 1.5];

N = length(x); 
r = zeros((2*N)-1,1);
l = (-N + 1: N - 1);

lenR = (2*N)-1;

for n=1:lenR

    if (l(n) < 0)

        zeroPad = zeros(N-n,1);
        paddedSig = [y(1:n,1);zeroPad];

        r(n,1) = x' * paddedSig;

    elseif (l(n) == 0)
    
        r(n,1) = x.' * paddedSig;

    else

        zeroPad = zeros(l(n),1);
        yEndIndex = N - l(n);
        paddedSig = [zeroPad;y(1:(yEndIndex),1)];

        r(n,1) = x.' * paddedSig;

    end
end