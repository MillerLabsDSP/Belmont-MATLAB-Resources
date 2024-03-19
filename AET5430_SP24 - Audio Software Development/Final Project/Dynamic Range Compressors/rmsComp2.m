%% rmsComp2.m
% For real-time processing!
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
alphaA = exp(-log(9)/(Fs * attackTime));
releaseTime = 0.25;
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % smoothing variable

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

for n=1:N

    % Convert input signal into unipolar on dB scale
    x_dB = 20*log10(abs(x(n,1)));

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

    gainChange_dB = gainSC - x_dB;

    % Smooth over the gainChange
    if gainChange_dB < gainSmoothPrev
        % attack mode
        gainSmooth = -sqrt(((1-alphaA)*gainChange_dB^2) ... 
            +(alphaA*gainSmoothPrev^2));
    else
        % release mode
        gainSmooth = -sqrt(((1-alphaR)*gainChange_dB^2) ... 
            +(alphaR*gainSmoothPrev^2));
    end

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);

    % Apply linear amplitude to input sample
    y(n,1) = lin_A(n,1) * x(n,1);

    % Update gainSmoothPrev used in the next iteration
    gainSmoothPrev = gainSmooth;

end
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal'); axis([0 7 -1.1 1.1])
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 7 -1.1 1.1]);
legend('Output Signal','Gain Reduction');