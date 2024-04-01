%% dkMethod.m
% Zachary Miller
% 22 March 2024

Fs = 48000; % only dealing with discrete time!
Ts = 1/Fs;

% Resistor/capacitor values
R1 = 5000;
C = 10e-9;

% Variables
Rc = Ts/(2*C);
G = 1/R1 + 1/Rc;

fc = 1/(2*pi*R1*C); % cutoff freq

% Coefficients
b0 = 1/(R1*G);
b1 = 1/G;

x1 = 0; % state

u = [1;zeros(2047,1)]; % IR
N = length(u);
y = zeros(N,1);

for n=1:N

    % Step 1: difference equation
    y(n,1) = b0 * u(n,1) + b1 * x1;
    
    % Step 2: update states
    x1 = (2/Rc) * y(n,1) - x1; % Easy because Vout = Vc

end

[H,W] = freqz(y,1,N,Fs);
semilogx(W,20*log10(abs(H)));
axis([20 20000 -30 5]);

% Laplace - take TF and compares to Kirchhoff
    % Hs = (1/RC) / (s + (1/RC))
num = 1/(R1*C);
den = [1,1/(R1*C)];

[dNum,dDen] = bilinear(num,den,Fs);

[Hd,Wd] = freqz(dNum,dDen,N,Fs);

hold on;
semilogx(Wd,20*log10(abs(Hd)),'--');
axis([20 20000 -30 5]);
hold off;