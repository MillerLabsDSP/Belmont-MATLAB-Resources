% transformProcessing.m
% Zachary Miller
% 12 March 2024

% Time-domain signal
% [x,Fs] = audioread('AcGtr.wav');

% Small-scale input
% x = randn(4,1);

% Summation of two signals
Fs = 480; Ts = 1/Fs;
t = [0:Ts:1-Ts].';
x = sin(2*pi*10*t);
w = sin(2*pi*17*t);
sum = x + w;
figure; plot(sum);

% Frequency-domain signal
X = fft(x);
W = fft(w);

% Separate amplitude and phase
% Xamp = abs(X);
% Xphase = angle(X);
% Y = Xamp .* exp(1j*Xphase); % direct amp/phase -> complex Y

% Y = 2*X;
Y = X + W;

% Put together -> cartesian coordinates
% Xre = Xamp .* cos(Xphase);
% Xim = Xamp .* sin(Xphase);
% Y = Xre + Xim*1j;

% y = real(ifft(X));
y = real(ifft(Y)); % for summation of two signals

figure; plot(y); % synthesized output
% plot(y-x); % round-off error

% Time-domain convolution as frequency-domain multiplication
x = [0:0.1:0.9].';
h = [0.4:-0.1:0.1].';
y1 = conv(x,h);

xpad = [x;zeros(length(h)-1,1)];
hpad = [h;zeros(length(x)-1,1)];

X = fft(xpad);
H = fft(hpad);

Y = X .* H;
y = real(ifft(Y));

% Round-off error in dB
dBRoundOff = 20*log10(max(y-y1));
fprintf('~ %ddB\n',round(dBRoundOff));