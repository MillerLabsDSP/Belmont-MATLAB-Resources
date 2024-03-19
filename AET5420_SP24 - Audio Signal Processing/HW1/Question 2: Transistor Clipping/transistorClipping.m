%% transistorClipping.m
% Zachary Miller
% 22 Jan 2024

function [out] = transistorClipping(in,thresh)

threshLock = thresh; % constant input threshold level
release = thresh; % modular input threshold level

for n=1:length(in)
    x = in(n,1);
        if (x > thresh) && (thresh <= threshLock)
            y = release;
            release = release - 1/96000; % release = release - Ts;
            thresh = thresh - 1/96000; % " " - Ts;
        elseif (x < -thresh) && (thresh <= threshLock)
            y = -release;
            release = release - 1/96000; % release = release - Ts;
            thresh = thresh - 1/96000; % " " - Ts;
        else
            y = x;
            release = thresh; % reset release value
            thresh = threshLock; % reset to initial threshold value
        end

out(n,1) = y;

end