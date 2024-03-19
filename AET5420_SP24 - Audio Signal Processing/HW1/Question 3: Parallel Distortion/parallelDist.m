%% parallelDist.m
% Zachary Miller
% 28 Jan 2024

% Sine wave test input
% Fs = 48000; 
% Ts = 1/Fs;
% t = [0:Ts:1-Ts].';
% N = 48000;
% f = 5;
% in = sin(2*pi*f*t); % sine input

% Audio file input
[in,Fs] = audioread('funkBass - unprocessed.wav');
N = length(in);

% Gain variables
g1 = 0.1; % neutral, y = x * gain
g2 = 0.3; % full wave rectification, y = |x| * gain
g3 = 0.001; % infinte clipping, y = "infClip(x)" * gain

bypass = "Y"; % bypass fx [Y/N]

% Initialize output channels
outFWR = zeros(N,1);
outIC = zeros(N,1);

if (bypass == "Y")
    for n=1:N
        % Full-wave rectification
        x = in(n,1);
    
        if (x < 0)
            y = x*-1;
        else
            y = x;
        end   
        
        outFWR(n,1) = y;
        
        % Infinite clipping
        if (x > 0)
            y = 1;
        else
            y = -1;
        end
    
        outIC(n,1) = y;
    end
end

% Summing
output = (g1*in) + (g2*outFWR) + (g3*outIC);
sound(output,Fs);
% audiowrite('funkBass - processed.wav',output,Fs);