%% bpfStateSpace.m
% Zachary Miller
% 19 March 2024

clear; clc; close all;

R1 = 10000;
C1 = 15 * 10^-8;
f1 = 1/(2*pi*R1*C1); % around 100 (HPF)

R2 = 10000;
C2 = 560*10^-11;
f2 = 1/(2*pi*R2*C2); % around 3000 (LPF)

a11 = (-1/(R1*C1) + -1/(R2*C1));
a12 = -1/(R2*C1);
a21 = -1/(R2*C2);
a22 = -1/(R2*C2);

A = [a11 a12 ; a21 a22];

b11 = (1/(R1*C1) + 1/(R2*C1));
b21 = 1/(R2*C2);

B = [b11 ; b21];

C = [0 1];

D = [0];

% Bilinear transform
Fs = 48000;
[Ad,Bd,Cd,Dd] = bilinear(A,B,C,D,Fs);

x = [0;0]; % second order state

input = [1; zeros(1023,1)];
N = length(input);

output = zeros(N,1);
for n=1:N
    u = input(n,1);
    y = Cd * x + Dd * u;
    x = Ad * x + Bd * u;
    output(n,1) = y;
end

[H,W] = freqz(output,1,1024,Fs);
semilogx(W,20*log10(abs(H))); axis([20 20000 -25 5]); hold on;

% Continuous-time TF
[bc,ac] = ss2tf(A,B,C,D);
w = 2*pi*[20:20000]; % freq in cyc/sec to freq in rad/sec
[Hc,Wc] = freqs(bc,ac,w);
semilogx(Wc/(2*pi),20*log10(abs(Hc))); axis([20 20000 -25 5]); hold off;

