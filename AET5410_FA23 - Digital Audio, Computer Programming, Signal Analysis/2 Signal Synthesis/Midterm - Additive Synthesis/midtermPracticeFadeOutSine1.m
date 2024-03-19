%% AET5410 Midterm Practice
% Zachary Miller
% Concatenating Signals, solution 1

clear; clc;

Fs = 48000;
f = 500;
Ts = 1/Fs;
StopTime = 4; % seconds
t = [0:Ts:StopTime-Ts]';

x=sin(2*pi*f*t);
N = length(x);

newSig1 = x(1:144000);
m = linspace(1,0,(StopTime*Fs - length(newSig1)))';
newSig2 = x(144001:192000) .* m;
catSig = [newSig1;newSig2];
plot(t,catSig); 
sound(catSig,48000);