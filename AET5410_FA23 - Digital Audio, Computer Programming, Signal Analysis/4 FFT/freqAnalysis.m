%% freqAnalysis.m
% Script meant to analyze a sine wave using inner product

clear; clc;

Fs = 64;
Ts = 1 / Fs;

t = [0:Ts:1-Ts].';
f = 4;
x = square(2*pi*f*t);
N = length(x);

% Harmonics = f * 1, 3, 5, 7, 9...
harmNum = 3;
h = f * harmNum;

% p = sin(2*pi*h*t);
% y = sum(x .* p);
% y = x.' * p;

% X = zeros((Fs/2),1);
% 
% for f=0:(Fs/2)
% 
%     p = sin(2*pi*f*t);
% 
%     X(f+1,1) = x.' * p;
% 
% end
% 
% plot(X);

f = 0:32;

% Linear amplitude, linear freq
% plot(f,X);

% Decibels amp, linear freq
% plot(f,20*log10(X));

% Log freq, decibel amp
% semilogx(f,20*log10(X));

% Ex 2: Audio Example

Fs = 48000;
Ts = 1/Fs;
f = 1000;
t = [0:Ts:1-Ts].';
Nyq = Fs/2;
N = length(x);

x = sawtooth(2*pi*f*t);

X = zeros(Nyq+1,1);

for f=0:Nyq

    p = sin(2*pi*f*t);

    X(f+1,1) = x.' * p;

end

f=0:Nyq;

plot(f,X);

% semilogx(f,20*log10(X));
% axis([0,Nyq,50,100]);
% xticks([1000 3000 5000 7000 9000])