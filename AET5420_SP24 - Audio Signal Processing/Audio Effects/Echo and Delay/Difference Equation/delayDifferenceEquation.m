%% delayDifferenceEquation.m
% Zachary Miller
% 5 Feb 2024

% The difference equation is the discrete-time version of a differential
% equation.

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
N = 48000;
f = 5;

x = sin(2*pi*f*t);
y = zeros(N,1);

% Delay
d = 500;
for n=1:N
    if (n-d1 < 1)
        y(n,1) = x(n,1) + x(n,1);
    elseif (n-d2 < 1)
        y(n,1) = x(n,1) + x(n-d,1);
    end
end

% Difference equation
% y[n] = x[n] + x[n-d]; % keep commented out
    % where x[n-d] = w[n]