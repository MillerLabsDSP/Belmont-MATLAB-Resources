%% softKnee.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; clear all;

% Simple input signal
x = [0:.001:1].';
N = length(x);

% Initialize static characteristics
T = -12; % threshold (dBFS)
R = 4; % ratio (4:1)
W = 4; % knee width (dB)

for n=1:N
    % Convert to dB
    x_dB(n,1) = 20 * log10(abs(x(n,1)));
    if (x_dB(n,1) < -144)
        x_dB(n,1) = -144; 
    end                   

    % Comparison to threshold
    if x_dB(n,1) > (T + W/2)
        % Above knee curve
        g_sc(n,1) = T + ((x_dB(n,1) - T)/R);
    elseif x_dB(n,1) > (T - W/2)
        % Within knee curve
        g_sc(n,1) = x_dB(n,1) + ...
        ((1/R - 1)*(x_dB(n,1) - T + W/2)^2)/(2*W);
    else
        % Do not compress
        g_sc(n,1) = x_dB(n,1);
    end
end

plot(x_dB,g_sc); % compressor characteristic curve plot
xlabel('Input Amplitude (dBFS)'); ylabel('Output Amplitude (dBFS)');
axis([-20 0 -20 0])
