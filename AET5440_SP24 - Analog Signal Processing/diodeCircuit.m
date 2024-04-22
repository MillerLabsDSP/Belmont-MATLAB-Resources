%% diodeCircuit.m
% Zachary Miller
% 9 April 2024

% This script models a circuit with a resistor
% and a diode. The output is taken as the voltage
% across the diode.

clear; clc; close all;

Fs = 4800;
Ts = 1/Fs;
f = 4;
t = [0:Ts:1].';
x = sin(2*pi*f*t); % sin for clip rather than IR
% [x,Fs] = audioread('CleanFunkGuitar.wav');

% Diode parameters
Is = 10e-12;
Vt = 0.026;
eta = 1;

R = 4e3;

N = length(x); y = zeros(N,1);
Vd = 0; % initial guess

TOL = 1e-9; fprintf('Tolerance discrepancy (dB): %s\n', TOL);
for n=1:N

    Vin = x(n,1);
    % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) - (Vin/R);
    % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) + (Vin/R);
    % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) - (Vin/R);
    fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) + (Vin/R);

    count = 0;
    while ((abs(fVd) > TOL) && (count < 5))

        der = 1/R + (Is/(Vt*eta)) * (exp(Vd/(Vt*eta)));

        Vd = Vd - fVd/der; % guess state update

        % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) - (Vin/R); % Vd update
        % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) + (Vin/R);
        % fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) - (Vin/R);
        fVd = (Vd/R) + Is*(exp(Vd/(Vt*eta))-1) + (Vin/R);

        count = count + 1;

    end

    % Vout = Vd;
    % Vout = -Vd;
    % Vout = Vin - Vd;
    Vout = Vd + Vin;
    y(n,1) = Vout;

end

plot(t,x,t,y);
% sound(y,Fs);