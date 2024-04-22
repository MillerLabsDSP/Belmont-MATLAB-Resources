%% diodePair.m
% Zachary Miller
% 10 April 2024

clear; clc; close all;

Fs = 4800;
Ts = 1/Fs;
f = 4;
f = 200; % for THD
t = [0:Ts:1].';
x = sin(2*pi*f*t); % sin for clip rather than IR
% [x,Fs] = audioread('CleanFunkGuitar.wav');

% Diode parameters
Is = 10e-9;
Vt = 0.026;
eta = 2;

etaVt = eta*Vt;

R = 1e3;

N = length(x); y = zeros(N,1);
Vd = 0; % initial guess

TOL = 1e-18; fprintf('Tolerance discrepancy (dB): %s\n', TOL);
for n=1:N

    Vin = x(n,1);

    % fVd = Is * (exp(Vd/(etaVt))-1) - Is * (exp(-Vd/(etaVt))-1) + Vd/R - Vin/R;
    fVd = 2*Is*sinh(Vd/etaVt) + Vd/R - Vin/R;
    
    count = 0;
    while ((abs(fVd) > TOL) && (count<5))

        % der = (Is/(etaVt)) * exp(Vd/(etaVt)) + (Is/(etaVt)) * exp(-Vd/(etaVt)) + 1/R;
        der = 2*Is/etaVt * cosh(Vd/etaVt) + 1/R;
        
        Vd = Vd - fVd/der; % update guess

        % fVd = Is * (exp(Vd/(etaVt))-1) - Is * (exp(-Vd/(etaVt))-1) + Vd/R - Vin/R;
        fVd = 2*Is*sinh(Vd/etaVt) + Vd/R - Vin/R;

        count = count + 1;

    end

    Vout = Vd;

    y(n,1) = Vout;

end

subplot(2,1,1); plot(t,x,t,y); 
legend('Input','Output'); axis([0 0.03 -1 1]);
title('I/O Plot');
subplot(2,1,2); plot(x,x,x,y);
title('Characteristic Curve');
% thd(y,Fs);
% sound(y,Fs);