%% hDelay.m
% AET5420 Midterm
% Zachary Miller
% 28 Feb 2024

function [y] = hDelay(x,Fs,delayMS,mix,bits)
    
    % Time parameters
    delaySec = delayMS / 1000;

    % Buffer initialization
    delayLenSamples1 = delaySec * Fs;
    buffer1 = zeros(delayLenSamples1,1);

    % Delay schematic parameters
    g1 = 1-mix; 
    g2 = mix;
    
    N = length(x);
    y = zeros(N,1);
    yCRUSH = zeros(N,1);

    numAmpLevels = 2^bits;
    
    for n=1:N
        u = buffer1(end,1); % index last sample of delay buffer
        
        % Separate paths
        y(n,1) = g1 * x(n,1);
        yCRUSH(n,1) = g2 * u;

        % Bit crush
        yBit = yCRUSH(n,1);
        xSmall = 0.5 * yBit + 0.5;
        xStretch = xSmall * numAmpLevels;
        yStretch = round(xStretch);
        ySmall = yStretch * (1/numAmpLevels);
        yBit = 2 * ySmall - 1;
        yCRUSH(n,1) = yBit;

        buffer1 = [y(n,1);buffer1(1:end-1,1)];
    end


    % Combine paths
    y = y + yCRUSH;

end