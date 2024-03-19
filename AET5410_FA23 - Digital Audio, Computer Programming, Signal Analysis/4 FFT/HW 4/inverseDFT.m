%% inverseDFT.m
% Zachary Miller
% AET5410
% HW4 #2

clear; clc; close all;

% Read in amplitude and phase data
[amp,Fs] = audioread('Xamp.wav'); % amplitude in frequency-domain
[phase,Fs] = audioread('Xphase.wav'); % phase in frequency-domain
Ts = 1/Fs;

N = length(amp); % length of both signals, N = 4096

% Preallocate "wk"
wk = zeros(N,1);

for k=0:N-1
    wk(k+1,1)=k*2*pi*Fs/N;
end

% Create complex-valued signal via amp and phase
Xr = amp .* cos(phase);
Xi = amp .* sin(phase);
X = Xr + 1j * Xi;

% Initialize storage matrix
p = zeros(N,N);

% Load values from periodic signals into p matrix
% Time variable is preallocated in this loop
for n=1:N
    t=(n-1)*Ts;   
    p(n,:) = cos(wk*t) + sin(wk*t) * 1i;
end

% Convert to real values only
x=real((1/N)*p*X);
plot(x);
plotZoom = 1; % 10 times
axis([0 N/plotZoom -1.5 1.5]);

% Export audio
% audiowrite('inverseDFT.wav',x);