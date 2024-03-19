%% convFreq.m
% Zachary Miller
% 25 Feb 2024

function [y] = convFreq(x,h)

    % Parameters
    N = length(x);
    M = length(h);
    
    % Pad signals
    x = [x;zeros(M-1,1)]; % input
    h = [h;zeros(N-1,1)]; % impulse response

    % Time-domain to freq-domain
    X = myradix2dft(x); 
    H = fft(h);

    % Freq-domain to time-domain
    Y = X.*H;
    y = real(ifft(Y));

end