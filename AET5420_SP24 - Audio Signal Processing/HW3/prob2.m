%% prob2.m
% Zachary Miller
% 28 March 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
t = [0:Ts:5-Ts].';

Nyq = Fs/2;

T = length(t);

xmin = -1;
xmax = 1;
white = xmin + rand(1,Fs) * (xmax-xmin);

white = -1 + (1+1)*rand(T,1); % white noise (5s)
% plot(t,white);

band = 11.71875; % Hz
                 % This frequency ensures a range maximum of Fs
                 % so that 
order = 10e1;

i = 1; dBAmp = 0;
while (band <= Nyq)

    if (i == 1)
        freq(1,1) = 0;
    else
        freq(1,i) = band/Nyq; % not normalized
    end

    linAmp(1,i) = 10.^(dBAmp./20); % dB conversion

    band=band*2; % frequency scalar (octave)
    dBAmp=dBAmp-3; % decrease by 3dB
    i=i+1; % count scalar

end

[b] = fir2(order,freq,linAmp);
% figure;
% freqz(b,1,2048,Fs); % plot response

pink = conv(white,b);
N = length(pink);

semilogx(20*log10(abs(fft(pink))/N));
axis([10e0 Nyq -120 -60]);
title('Power Spectral Density: Pink Noise');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');

% sound(pink,Fs);
audiowrite('pinknoise.wav',pink,Fs);