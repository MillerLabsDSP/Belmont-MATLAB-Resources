%% distortionTypes.m

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
N = 48000;
f = 100;

x = sin(2*pi*f*t);

N = length(x);
y = zeros(N,1);

% Cubic distortion/clipping
% for n=1:N
%     y(n,1) = x(n,1) - (1/3)*(x(n,1))^3;
% end

% Arctan distortion
alpha = 5; % [1-10]

for n=1:N
    y(n,1) = (2/pi) * atan(alpha * x(n,1));
end

% Waveform plot
% plot(t,x,t,y);

% Characteristic curve
plot(x,x,x,y);

% Total harmonic distortion (THD) plot
% thd(y,Fs);
