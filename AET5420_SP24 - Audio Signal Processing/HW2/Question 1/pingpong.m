%% pingpong.m
% LR (difference equation) and LCR (linear buffer) delays
% Zachary Miller
% 15 Feb 2024

function [out] = pingpong(x,Fs,BPM,note,wet,feedback)
     
    % Convert BPM to samples per second
    BPS = BPM/60;
    SPB = 1/BPS;
    secDelay = SPB * note;
    d = round(secDelay * Fs);

    % Wet/dry
    wet = 1-(wet/100); % [0 "dry" - 1 "wet"]

    % Initialize signals
    N = length(x);
    % out = zeros(N,1); % For "LRLR..."
    out = zeros(N,2); % For "LCRLCR..."

    % Square-root pan function variable 
    sqRoot = sqrt(2)/2;

    % Delay lengths in samples
    delayLenSamples1 = d;
    delayLenSamples2 = d*2;
    delayLenSamples3 = d*3;
    delayLenSamples4 = d*4;

    % Buffers
    buffer1 = zeros(delayLenSamples1,1);
    buffer2 = zeros(delayLenSamples2,1);
    buffer3 = zeros(delayLenSamples3,1);
    buffer4Left = zeros(delayLenSamples4,1);
    buffer4Right = buffer4Left; % duplicate channel initialization

    % Delay schematic parameters
    g1 = 0.6; % b1
    g2 = 0.4; % b2
    g3 = 0.2; % b3
    g = feedback/100; % -a1
    
    for n=1:N

        % Buffer initialization
        w = buffer1(end,1); % index last sample of delay buffer
        v = buffer2(end,1); % " "
        u = buffer3(end,1); % " "
        zL = buffer4Left(end,1); % " "
        zR = buffer4Right(end,1); % " "
        
        % Consolidate and apply square-law panning to sides
        g1w = sqRoot*g1*w; 
        g2v = g2*v; 
        g3u = sqRoot*g3*u;
        gzL = sqRoot*g*zL; 
        gzR = sqRoot*g*zR;
        
        % Output delay
        out(n,1) = (1-wet) * (g1w + (0.5 * g2v) + gzL);
        out(n,2) = (1-wet) * ((0.5 * g2v) + g3u + gzR);

        % Output with input signal
            % Comment out to see only delay
        % out(n,:) = out(n,:) + wet * (0.5 * x(n,1));
        
        % Buffer increment
        buffer1 = [x(n,1);buffer1(1:end-1,1)];
        buffer2 = [x(n,1);buffer2(1:end-1,1)];
        buffer3 = [x(n,1);buffer3(1:end-1,1)];
        buffer4Left = [out(n,1);buffer4Left(1:end-1,1)]; % route stereo left out
        buffer4Right = [out(n,2);buffer4Right(1:end-1,1)]; % route stereo right out

    end
end

%%
    % % Square-root pan function variable
    % sqRoot = sqrt(2)/2;
    % 
    % % Scale feedback
    % g = feedback/100; % 100 = 1, 50 = 0.5, 0 = 0
    % 
    % % "LRLR" feedback difference equation
    % for n=1:N
    %     if n < d+1
    %         out(n,1) = wet * x(n,1) * sqRoot;
    %         out(n,2) = wet * x(n,1) * sqRoot;
    %     else
    %         out(n,1) = (1-wet) * (x(n-d,1) + g * out(n-d,2)) * sqRoot;
    %         out(n,2) = (1-wet) * (out(n,1) - g * out(n-d,1)) * sqRoot;
    %         out(n,1) = out(n,1) + wet * x(n,1) * sqRoot;
    %         out(n,2) = out(n,2) + wet * x(n,1) * sqRoot;
    %     end
    % end








    