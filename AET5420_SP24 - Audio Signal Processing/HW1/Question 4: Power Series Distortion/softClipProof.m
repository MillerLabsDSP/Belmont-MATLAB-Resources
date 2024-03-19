%% Soft-clipping comparison script
% Zachary Miller
% 30 Jan 2024

% Input signal
Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 4;

% Soft-clipping with function
x = sin(2*pi*f*t);
y = softClip(x);
subplot(2,1,1)
plot(y);
title('distortion with softClip() function')

% Soft-clipping with trig identities
in = (7/8)*(sin(2*pi*f*t)) + (1/48)*(sin(2*pi*(3*f)*t)) + (1/80)*(sin(2*pi*(5*f)*t));
subplot(2,1,2)
plot(in);
title('distortion with trig identities')