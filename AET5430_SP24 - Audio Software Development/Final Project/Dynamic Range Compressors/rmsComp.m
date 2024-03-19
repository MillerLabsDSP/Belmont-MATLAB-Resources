%% rmsComp.m
% Zachary Miller
% 1 March 2024

% Hack Audio (Ch. 18)

clear; clc; close all; 

% Audio input signal
[x,Fs] = audioread('AcGtr.wav');

% Compressor parameters
T = -20; % threshold (dBFS)
R = 4; % ratio (R:1)

% Attack/release times
attackTime = 0.1;
alphaA = (exp(-log(9)/Fs * attackTime));
releaseTime = 0.25;
alphaR = (exp(-log(9)/Fs * releaseTime));

gainSmoothPrev = 0; % smoothing variable

M = 2048; % length of RMS calculation

% Initialize first time window of buffer
x_win = [zeros(M/2,1);x(1:(M/2),1)];

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

for n=1:N

    % Calculate the RMS for the current window
    x_rms = sqrt(mean(x_win.^2));

    % Convert input signal into unipolar on dB scale
    x_dB = 20*log10(x_rms);

    % Cap noise floor
    if x_dB < -96
        x_dB = -96;
    end

    % Static characteristics
    if x_dB > T
        gainSC = T + (x_dB - T)/R; % compress
    else
        gainSC = x_dB; % do not compress
    end

    gainChangedB = gainSC - x_dB;

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainChangedB/20);

    % Apply linear amplitude to input sample
    y(n,1) = lin_A(n,1) * x(n,1);

    % Update current time window
    if n+(M/2) < N
        x_win = [x_win(2:end,1);x(n+(M/2)+1,1)];
    else
        x_win = [x_win(2:end,1);0];
    end

end
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal'); axis([0 7 -1.1 1.1])
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 7 -1.1 1.1]);
legend('Output Signal','Gain Reduction');