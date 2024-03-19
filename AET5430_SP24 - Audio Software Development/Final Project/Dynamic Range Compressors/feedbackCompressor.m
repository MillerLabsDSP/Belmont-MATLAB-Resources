%% feedbackCompressor.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; close all;

% Audio file input
[x,Fs] = audioread('AcGtr.wav');

% Parameters
T = -15; % threshold (dBFS)
R = 10; % ratio (R:1)

% Separate attack/release times
attackTime = 0.05; % in seconds
alphaA = exp(-log(9)/(Fs * attackTime));
releaseTime = 0.25; % in seconds
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % smoothing variable

y_prev = 0; % output for feedback detection

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

% Iterate over samples
for n = 1:N

    % Convert input signal into unipolar on dB scale
    y_uni = abs(y_prev);
    y_dB = 20*log10(y_uni);

    % Remove values of negative infinity
    if y_dB < -96
        y_dB = -96;
    end

    % Static characteristics
    if y_dB > T
        gainSC = T + (y_dB - T)/R; % compress
    else
        gainSC = y_dB; % do not compress
    end

    gainChange_dB = gainSC - y_dB;

    % Smooth over the gainChange
    if gainChange_dB < gainSmoothPrev
        % attack mode
        gainSmooth = ((1-alphaA)*gainChange_dB) ...
            +(alphaA*gainSmoothPrev);
    else
        % release mode
        gainSmooth = ((1-alphaR)*gainChange_dB) ...
            +(alphaR*gainSmoothPrev);
    end

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);

    % Apply linear amplitude to input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    y_prev = y(n,1); % update for next iteration

    % Update gainSmooth
    gainSmoothPrev = gainSmooth;
end
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal'); axis([0 7 -1.1 1.1])
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 7 -1.1 1.1]);
legend('Output Signal','Gain Reduction');