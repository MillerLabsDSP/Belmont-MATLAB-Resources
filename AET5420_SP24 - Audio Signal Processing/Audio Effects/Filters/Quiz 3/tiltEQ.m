%% tiltEQ.m
% Zachary Miller
% 27 March 2024

function [y] = tiltEQ(input,Fs,tilt)

    % tilt = -6dB to +6dB
    
    Nyq = Fs/2;
    order = 1000;
    
    f = [0 Nyq/4 Nyq/2 (3*Nyq/4) Nyq]; % frequency (Hz) plot points
    freqNorm = f/Nyq; % normalize
    m = [0-tilt ((0-tilt)/2) 0 ((0+tilt)/2) 0+tilt]; % magnitude plot points
    amp = 10.^(m./20); % transform tilt
    
    [b] = fir2(order,freqNorm,amp);
    freqz(b,1,2048); % plot response
    axis([0 1 -10 10]);
    
    y = conv(input,b); % convolve with input

end