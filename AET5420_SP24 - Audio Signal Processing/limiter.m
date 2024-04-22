%% limiter.m
% Zachary Miller
% 16 April 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';

[x,Fs] = audioread('funkBass - unprocessed.wav');
maxInput = max(x); fprintf('Max peak (linear) of input signal: %f\n', maxInput);
% x = 0.5 * (x(:,1) + x(:,2)); % if stereo, collapse to mono
N = length(x);

threshold = 0.75;
attackMs = 10;
    attackSamples = attackMs*0.001*Fs;
releaseMs = 5;
    releaseSamples = releaseMs*0.001*Fs;
    releaseSlew = 1/(releaseSamples + 1); % approximation
    % releaseSlew = 1 - exp(-1/releaseSamples);
holdMs = 15;
    holdSamples = (holdMs*0.001)*Fs;

inputGain = 1;
xGain = x .* inputGain;

y = zeros(N,1); gain = y; relEnvelope = y;
for n=1:N

    sample = xGain(n,1);

    % Hard clip module 
    if (abs(sample) > threshold)
        gain(n,1) = threshold/abs(sample);
    else
        gain(n,1) = 1;
    end

end

% plot(x.*gain) --> hard clipped signal

% Moving minimum (entire signal)
M_window = attackSamples + holdSamples;
M = movmin(gain,M_window);

% Release module
output = 1;
for n=1:N
    output = output + ((M(n,1) - output) * releaseSlew);
    output = min(output, M(n,1));
    relEnvelope(n,1) = output;
end

% FIR filter envelope smoothing
order = 1;
if (mod(attackSamples,2) == 0)
    attackSamples = attackSamples - 1;
end
smoothEnv = sgolayfilt(relEnvelope,order,attackSamples); % Savitzky-Golay filter

% Combine parallel paths
out = xGain .* smoothEnv;

figure(1);
plot(gain); axis([0 N 0 1]); hold on;
plot(M); plot(smoothEnv); hold off;
legend('Gain reduction', 'Moving minimum envelope', 'Smoothed moving minimum');

% subplot(2,1,1); plot(x); 
% title('Input signal');
% yline(threshold); yline(-threshold); axis([0 N -1 1]);
% subplot(2,1,2); plot(out);
% title('Output signal');
% yline(threshold); yline(-threshold); axis([0 N -1 1]);

% Normalize
outNorm = out / max(out);

figure(2);
subplot(2,1,1); plot(x); axis([0 N -1 1]);
xlabel('Time'); ylabel('Amplitude');
title('Unprocessed');
subplot(2,1,2); plot(outNorm); axis([0 N -1 1]);
xlabel('Time'); ylabel('Amplitude');
title('Limited and normalized');