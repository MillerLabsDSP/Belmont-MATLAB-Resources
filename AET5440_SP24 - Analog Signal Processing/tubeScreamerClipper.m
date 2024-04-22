%% tubeScreamerClipper.m
% Zachary Miller
% 10 April 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
% f = 4;
f = 4;
t = [0:Ts:1].';
x = sin(2*pi*f*t); % sin for clip rather than IR
% [x,Fs] = audioread('CleanFunkGuitar.wav');

% Diode parameters
Is = 10e-12;
Vt = 0.026;
eta = 1;

C1 = 4.7e-8;
R1 = Ts/(2*C1);
C2 = 5.1e-11;
R2 = Ts/(2*C2);
R3 = 47e2;
R4 = 51e3;

Ga = 1/R1 + 1/R3;

etaVt = eta*Vt;

N = length(x); y = zeros(N,1);
Vd = 0; % initial guess

TOL = 1e-10; fprintf('Tolerance discrepancy (dB): %s\n', TOL);
x1 = 0; x2 = 0;
for n=1:N

    Vin = x(n,1);

    fVd = Vin/(Ga*R1) - Vin - x1/Ga + ...
            R1*x1 + R1*2*Is*sinh(Vd/etaVt) + ...
            (Vd*R1/R2) + (Vd*R1/R4) - R1*x2;
    
    count = 0;
    while ((abs(fVd) > TOL) && (count<5))

        der = R1/R2 + R1/R4 + R1*2*(Is/etaVt)*cosh(Vd/etaVt);
        
        Vd = Vd - fVd/der; % update guess

        fVd = Vin/(Ga*R1) - Vin - x1/Ga + ...
            R1*x1 + R1*2*Is*sinh(Vd/etaVt) + ...
            (Vd*R1/R2) + (Vd*R1/R4) - R1*x2;

        count = count + 1;

    end

    Vout = Vd + Vin;
    Va = Vin/(R1*Ga) - x1*Ga;

    x1 = 2/R1 * (Vin - Va) - x1; % state update
    x2 = 2/R2 * Vd - x2;

    y(n,1) = Vout;

end

subplot(2,1,1);
plot(t,x,t,y); 
legend('Input','Output'); axis([0 1 -1.5 1.5]);
title('I/O Plot');
subplot(2,1,2); plot(x,x,x,y);
title('Characteristic Curve');
% thd(y,Fs);
% sound(y,Fs);