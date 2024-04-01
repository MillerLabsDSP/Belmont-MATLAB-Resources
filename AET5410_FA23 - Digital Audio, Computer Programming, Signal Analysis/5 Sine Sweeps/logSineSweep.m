%% Log sine sweep

Fs = 48000;
StopTime = 10;
N=Fs*StopTime;
Ts=1/Fs;

f1 = 0; % 10^f1 - 1 Hz
f2 = 3; % 10^f2 - 1000 Hz

freqSweep = logspace(f1,f2,N).';
t = [0:Ts:StopTime-Ts].';

sine=zeros(N,1);

for i=1:N
    sine(i) = sin(2*pi*freqSweep(i)*t(i));
end

plot(sine);
sound(sine,Fs);