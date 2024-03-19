%% autoCorrelation.m
% Zachary Miller
% AET5410
% Quiz 3

% Example vectors from test
% x = [2 ; -1 ; 1 ; -2 ; 4];
% x = [5; 6; 5; -3; -7; 0; -1];

% Alternative input signals
x = randn(10,1);

% Periodic Signal (matches figure in problem specification)
% Fs = 48000; Ts = 1/Fs; f = 4; t = [0:Ts:1-Ts].';
% x = square(2*pi*f*t);

% Arrange plot layout
tiledlayout(4,1)

% Biased test plot
[R] = xcorr(x,x);
nexttile
plot(R);
title('biased (native)')

% Biased autocorrelation
N = length(x); Npad = (2*N-1)-N; % padding parameters
pad = zeros(Npad,1); % pad signal
xPad = [x;pad]; % concatenate zero pad to original signal

x = fft(xPad);
comConj = conj(x); % alter nonreal values with complex conjugate
rxx = x .* comConj; % element-wise
invDFT = ifft(rxx); % convert to time domain

N = length(rxx);

% Flip plot sectors
minSet = 1; % minimum parameter
midpoint = (N+1)/2; % midpoint
maxSet = N; % maximum parameter

r = [invDFT(midpoint+1:maxSet);invDFT(minSet:midpoint)]; % concatenate

% Plot biased autocorrelation
nexttile
plot(r);
title('biased')
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Example vectors from test
% x = [2 ; -1 ; 1 ; -2 ; 4];
% x = [5; 6; 5; -3; -7; 0; -1];

% Alternative input signals
x = randn(10,1);

% Periodic Signal (matches figure in problem specification)
% Fs = 48000; Ts = 1/Fs; f = 4; t = [0:Ts:1-Ts].';
% x = square(2*pi*f*t);

% Unbiased test plot
[R] = xcorr(x,x,'unbiased');
nexttile
plot(R);
title('unbiased (native)')

x = fft(x);
comConj = conj(x); % alter nonreal values with complex conjugate
rxx = x .* comConj; % element-wise
invDFT = ifft(rxx); % convert to time domain

l = flip(invDFT(2:end)); % flip across l=0 axis
r = [l;invDFT]; % concatenate
r = r / max(r); % normalize where max = 1

% I'll probably figure this out after I submit this, but after following
% your instructions, I still can't seem to get my unbiased autocorrelation
% to match with the native Matlab function. It's decently similar - no more
% no less. My issue is that the "invDFT(2:end)" values are already 
% symmetrical, so flipping and concatenating them onto the front-end of
% the inversely DFT'd signal is redundant... that's at least what I am
% seeing.

nexttile
plot(r);
title('unbiased')