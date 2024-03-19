%% ssFilters
% .m
% Zachary Miller
% 22 Feb 2024

clear; clc; close all;

Fs = 48000;

R = 5000; % Ohms
C = 0.5e-8; % Ferads

fc = 1/(2*pi*R*C); % ~6k cutoff

A = -1/(R*C);
B = 1/(R*C);
% C = 1; % LPF
% D = 0;
C = -1; % HPF
D = 1;


% Use bilinear transform to convert to digital
[Ad,Bd,Cd,Dd] = bilinear(A,B,C,D,Fs);
[b,a] = ss2tf(Ad,Bd,Cd,Dd);
freqz(b,a);
axis([0 0.3 -70 0])

Vin = [1;zeros(511,1)];  % input
Vc = 0; % single capacitor
N = length(Vin);
Vout = zeros(N,1);

% Filtering using a loop
for n=1:N
    Vout(n,1) = Cd * Vc + Dd * Vin(n,1);
    Vc = Ad * Vc + Bd * Vin(n,1);
end
figure
freqz(Vout);
axis([0 0.3 -70 0])
