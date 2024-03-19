%% userConv.m
% Zachary Miller
% 24 Feb 2024
% Assuming mono signals for input and impulse response

function [y] = userConv(x,h)

    % Input parameters
    N = length(x);
    M = length(h);
    
    % Pad and overwrite input
    x = [zeros(M,1);x;zeros(M-1,1)]; % pad
    x = flip(x); % flip input
    
    % Initialize output signal and buffer
    y = zeros(N+M-1,1);
    buffer = zeros(1,M);

    % Inner product loop
    for i=1:length(y)

        buffer(1,1:M) = x(1:M);
        x(1,end) = x(1,1);
        x(1:end-1,1) = x(2:end,1);
        
        % Inner product calculation
        y(i,1) = buffer * h;

    end
    y = flip(y);
end