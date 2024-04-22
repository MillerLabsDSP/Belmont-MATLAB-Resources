%% bpfClipper.m
% Zachary Miller
% 10 April 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
% f = 4;
f = 1000;
t = [0:Ts:1].';
x = sin(2*pi*f*t); % sin for clip rather than IR
[x,Fs] = audioread('CleanFunkGuitar.wav');

% Diode parameters
Is = 10e-9;
Vt = 0.026;
eta = 2;

C1 = 5e-9;
R1 = Ts/(2*C1);
C2 = 5e-9;
R2 = Ts/(2*C2);
R3 = 1e4;
R4 = 1e4;

f_LPF = 1/(2*pi*C1*R3); % cutoff frequency
f_HPF = 1/(2*pi*C2*R4);

Ga = 1/R1 + 1/R2 + 1/R3;

etaVt = eta*Vt;

N = length(x); y = zeros(N,1);
Vd = 0; % initial guess

TOL = 1e-10; fprintf('Tolerance discrepancy (dB): %s\n', TOL);
x1 = 0; x2 = 0;
for n=1:N

    Vin = x(n,1);

    fVd = R2 * 2 * Is * sinh(Vd/etaVt) + ...
        -Vin/(R3*Ga) + -x1/Ga + -Vd/(R2*Ga) + -x2/Ga + ...
        Vd + (R2/R4) * Vd + R2*x2;
    
    count = 0;
    while ((abs(fVd) > TOL) && (count<5))

        der = -1/(R2*Ga) + 1 + R2/R4 + ...
            R2 * 2*Is/etaVt * cosh(Vd/etaVt);
        
        Vd = Vd - fVd/der; % update guess

        fVd = R2 * 2 * Is * sinh(Vd/etaVt) + ...
        -Vin/(R3*Ga) + -x1/Ga + -Vd/(R2*Ga) + -x2/Ga + ...
        Vd + (R2/R4) * Vd + R2*x2;

        count = count + 1;

    end

    Vout = Vd;
    Va = Vin/(R3*Ga) + x1/Ga + Vd/(R2*Ga) + x2/Ga;

    x1 = 2/R1 * Va - x1; % state update
    x2 = 2/R2 * [Va-Vd] - x2;

    y(n,1) = Vout;

end

% subplot(2,1,1);
% plot(t,x,t,y); 
% legend('Input','Output'); axis([0 0.01 -1 1]);
% title('I/O Plot');
% subplot(2,1,2); plot(x,x,x,y);
% title('Characteristic Curve');
% thd(y,Fs);
sound(y,Fs);