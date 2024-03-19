% fourierTransform.m

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:1-Ts]';
f = 100;

x = square(2*pi*f*t);
N = length(x);

Xc = zeros(N,1);
Xs = zeros(N,1);

% FFT
for k = 0:N-1

   f = k * Fs / N; % actual frequencies in Hz

   pc = cos(2*pi*f*t);
   Xc(k+1,1) = x' * pc;

   ps = -sin(2*pi*f*t);
   Xs(k+1,1) = x' * ps;

   % Fourier transform
   X(k+1,1) = Xc(k+1,1) + Xs(k+1,1) * 1i; % make a complex number

end

% Horizontal "cosine axis"
a = (2/N) * Xc(101,1); % normalize amplitude
% Vertical "sine axis"
b = (2/N) * Xs(101,1); % normalize amplitude

Amp1 = sqrt(a^2 + b^2); % amp of 100 Hz

a = (2/N) * Xc(301,1); 
b = (2/N) * Xs(301,1); 

Amp2 = sqrt(a^2 + b^2); % amp of 300 Hz

a = (2/N) * Xc(501,1); 
b = (2/N) * Xs(501,1); 

Amp3 = sqrt(a^2 + b^2); % amp of 500 Hz

a = (2/N) * Xc(701,1); 
b = (2/N) * Xs(701,1); 

Amp4 = sqrt(a^2 + b^2); % amp of 700 Hz

a = (2/N) * Xc(901,1); 
b = (2/N) * Xs(901,1); 

Amp5 = sqrt(a^2 + b^2);% amp of 900 Hz

a = (2/N) * Xc(1101,1); 
b = (2/N) * Xs(1101,1); 

Amp6 = sqrt(a^2 + b^2);% amp of 1100 Hz

% THD

THD = 100 * (sqrt((Amp2^2 + Amp3^2 + Amp4^2 + Amp5^2 + Amp6^2)/Amp1^2));

