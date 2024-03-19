%% slewRateDistortion.m
% Zachary Miller
% 4 March 2024

function [out] = slewRateDistortion(in,Fs,maxFreq)

N = length(in);
Ts = 1/Fs;
peak = 1;
slewRate = maxFreq*2*pi*peak; % convert freq to slew rate

slope = slewRate*Ts;

out = zeros(N,1);
prevOut = 0;

for n=1:N
    % Determine the change between samples
    dlta = in(n,1) - prevOut;
    if dlta > slope % dont let dlta exceed max slope
        dlta = slope;
    elseif dlta < -slope
        dlta = -slope;
    end
    out(n,1) = prevOut + dlta;
    prevOut = out(n,1); % save current "out" for next loop
end