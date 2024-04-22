%% oversampler.m
% Zachary Miller
% 16 April 2024

clear; clc; close all;

Fs = 4800;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 1;
x = sin(2*pi*f*t);
N = length(x);

rate = 2; % oversampling (2x)
outputLen = N*rate;
y = zeros(outputLen+1,1); n = 1;

% Stretch old signal
for m=1:rate:outputLen
    y(m,1) = x(n,1);
    n = n + 1;
end

% Interpolate new samples
buffer = zeros(rate+1,1); M = length(y);
for m=1:M
    buffer = [buffer(2:end,1); y(m,1)];
    if (mod(m,3) == 0) && (m <= 3)
        y(m-1,1) = mean([buffer(1,1) buffer(3,1)]);
    elseif (mod(m,2) == 1) && (m > 3)
        y(m-1,1) = mean([buffer(1,1) buffer(3,1)]);
    end
end

y = y(1:length(x)*rate,1); % resize
y = resample(y,1,rate);

figure(1);
subplot(2,1,1); plot(x); 
title('Original'); axis([0 N -1 1]);
subplot(2,1,2); plot(y); 
title('Oversampled'); axis([0 length(y) -1 1]);

figure(2);
null = x - y; plot(null); axis([1 N -1 1]);
maxNull = max(null); maxNulldB = 20*log10(abs(maxNull));
title('Null test'); subtitle(['Max amplitude (dB): ', num2str(maxNulldB)]); 
