%% rmsPlot.m
% Zachary Miller
% 25 Feb 2024

% This function plots the RMS of a signal over
% buffers of size "M". Note that longer buffers
% result in a smoother envelope of the signal.

function [y] = rmsPlot(x)

    % Parameters
    N = length(x);
    y = zeros(N,1);

    % RMS calculation
    for n=1:N
        for m=(-M/2):(M/2)-1
            y(n,1) = x(n+m,1)^2;
        end
    end

    y = sum(y) * (1/M);

end