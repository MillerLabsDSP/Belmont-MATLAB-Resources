%% zeroCrossingRate.m

clear; clc;

Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:N-1]' * Ts;

f = 1000;
x = sin(2*pi*f*t - pi/2);

zeroCrossings = 0;

for n=2:N
    if x(n-1,1) < 0 && x(n,1) >= 0 || x(n-1,1) > 0 && x(n,1) <= 0
        zeroCrossings= zeroCrossings + 1;
    end
    x(n-1,1) = x(n,1);
end

% for n=2:N
    % if (x(n-1,1) * x(n,1) < 0)
    %     zeroCrossings = zeroCrossings + 1;
    % end
    % x(n-1,1) = x(n,1); 
% end

zeroCrossingsPerSecond = (zeroCrossings / N) * Fs;
cyclesPerSecond = zeroCrossingsPerSecond / 2;
disp(cyclesPerSecond);