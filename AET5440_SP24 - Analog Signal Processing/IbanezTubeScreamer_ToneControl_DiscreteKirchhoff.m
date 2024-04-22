%% IbanezTubeScreamer_ToneControl_DiscreteKirchhoff.m
% Zachary Miller
% 25 March 2024

clear; clc; close all;

Fs = 48000;
Ts = 1/Fs;

C1 = 0.22e-6;
R1 = Ts/(2*C1);
C2 = 0.22e-6;
R2 = Ts/(2*C2);
C3 = 0.22e-6;
R3 = Ts/(2*C3);
C4 = 1e-6;
R4 = Ts/(2*C4);

R5 = 220;
R6 = 1e3;
R7 = 1e3;
R8 = 220;
R9 = 1e3;
outPot = 0.5;
R10 = (1-outPot) * 100e3;
R11 = outPot * 100e3;

tonePot = 0.5;
P1 = tonePot * 20e3;
P2 = (1-tonePot) * 20e3;

G2 = 1 + R2/P1 + R5/P1;
G3 = 1 + R3/P2 + R8/P2;
Go = 1 + R10/R11 + R9/R11 + R4/R11;
Gx = 1 + R7/(G3*P2);
Gz = 1/R1 + 1/(G2*P1) + 1/R6;
Gr = P1/R2 + 1 + R5/R2;
Gs = 1 + P2/R3 + R8/R3;

b0 = Gx/(Go*R6*Gz);
b1 = Gx/(Go*Gz);
b2 = Gx*R2 / (Go*G2*Gz*P1);
b3 = -R3 * R7/(Go*G3*P2);
b4 = -R4/Go;

u = [1;zeros(2047,1)];
N = length(u);
y = zeros(N,1);

x1 = 0; x2 = 0; x3 = 0; x4 = 0;
for n=1:N

    % Difference equations
    Vin = u(n,1);
    Vout = b0*Vin + b1*x1 + b2*x2 + b3*x3 + b4*x4;
    
    % State updates
    Vx = Vin/(R6*Gz) + (x1/Gz) + R2/(G2*Gz*P1) * x2;
    x1 = (2/R1) * Vx - x1;
    x2 = (2/R2) * (Vx/Gr + x2*(P1+R5)/Gr) - x2;
    x3 = (2/R3) * (Vx/Gs + x3*(P2+R8)/Gs) - x3;
    x4 = (2/R11) * Vout + x4;

    y(n,1) = Vout;

end

[H,W] = freqz(y,1,N,Fs);
semilogx(W,20*log10(abs(H)));
axis([20 20000 -50 5]);