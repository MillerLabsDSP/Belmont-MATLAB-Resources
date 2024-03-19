%% Linear sine sweep

Fs = 48000;
StopTime = 15;
N=Fs*StopTime;
Ts=1/Fs;

f1 = 0;
f2 = 1500;

freqSweep = linspace(f1,f2,N).';
t = [0:Ts:StopTime-Ts].';

sine=zeros(N,1);

for i=1:N
    sine(i) = sin(2*pi*freqSweep(i)*t(i));
end

plot(sine);
sound(sine,48000);