%% panFunctions.m
% Zachary Miller
% 10 Jan 2024

%% Linear panning

% Input signal
[x,Fs] = audioread('AcGtr.wav');
% sound(x,Fs); % mono playback

% Panning
knobValue = -50; % knob in ProTools [-100 to +100]

% Convert to normalized scale
p = knobValue / 200 + 0.5;

aL = (1-p);
aR = p;

% Concatenate to create 2-column array
y = [ aL * x , aR * x ];

%% Square-law panning

% Input signal
[x,Fs] = audioread('AcGtr.wav');
% sound(x,Fs); % mono playback

% Panning
knobValue = -50; % knob in ProTools [-100 to +100]

% Convert to normalized scale
p = knobValue / 200 + 0.5;

aL = sqrt(1-p);
aR = sqrt(p);

% Concatenate to create 2-column array
y = [ aL * x , aR * x ]; 