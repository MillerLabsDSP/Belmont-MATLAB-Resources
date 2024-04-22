%% lpfClipper.m
% Zachary Miller
% 10 April 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;
% f = 4;
f = 50;
t = [0:Ts:1].';
x = sawtooth(2*pi*f*t); % sin for clip rather than IR

% Diode parameters
Is = 10e-9;
Vt = 0.026;
eta = 2;

C1 = 1e-8;
R1 = Ts/(2*C1);
R2 = 10000;

f = 1/(2*pi*R2*C1); % cutoff frequency

etaVt = eta*Vt;

R = 1e3;

N = length(x); y = zeros(N,1);
Vd = 0; % initial guess

TOL = 1e-10; fprintf('Tolerance discrepancy (dB): %s\n', TOL);
x1 = 0;
for n=1:N

    Vin = x(n,1);

    % fVd = Is * (exp(Vd/(etaVt))-1) - Is * (exp(-Vd/(etaVt))-1) + Vd/R - Vin/R;
    fVd = 2*Is*sinh(Vd/etaVt) + Vd/R1 + Vd/R2 - x1 - Vin/R2;
    
    count = 0;
    while ((abs(fVd) > TOL) && (count<5))

        % der = (Is/(etaVt)) * exp(Vd/(etaVt)) + (Is/(etaVt)) * exp(-Vd/(etaVt)) + 1/R;
        der = 2*Is/etaVt * cosh(Vd/etaVt) + 1/R1 + 1/R2;
        
        Vd = Vd - fVd/der; % update guess

        % fVd = Is * (exp(Vd/(etaVt))-1) - Is * (exp(-Vd/(etaVt))-1) + Vd/R - Vin/R;
        fVd = 2*Is*sinh(Vd/etaVt) + Vd/R1 + Vd/R2 - x1 - Vin/R2;

        count = count + 1;

    end

    Vout = Vd;

    x1 = 2/R1 * Vout - x1; % state update

    y(n,1) = Vout;

end

subplot(2,1,1); plot(t,x,t,y); 
legend('Input','Output'); axis([0 0.5 -1 1]);
title('I/O Plot');
% subplot(2,1,2); plot(x,x,x,y);
% title('Characteristic Curve');
% thd(y,Fs);
% sound(y,Fs);