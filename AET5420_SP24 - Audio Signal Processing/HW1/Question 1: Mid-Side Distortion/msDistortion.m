%% msDistortion.m
% Zachary Miller
% 22 Jan 2024

[x,Fs] = audioread('stereoDrums.wav');
L = x(:,1); R = x(:,2);

% Mid-Side Encoding
S = L-R; % side
M = L+R; % mid

% Hard clip mids
threshold = 0.4;
distMid = hardClip(M,threshold);

newS = S; % sides stay the same
distM = M; % distorted mids

% Mid-Side Decoding
leftNew = (1/2) * (distM + newS);
rightNew = (1/2) * (distM - newS);

% New stereo signal
y = [leftNew,rightNew];

% Mids comparison
plot(M);
hold on
plot(distM/2);
title('Mids');
legend('original','hard-clipped')

% Listen
% sound(y,Fs);

% Write processed drums file
audiowrite('distDrums.wav',y,Fs);
