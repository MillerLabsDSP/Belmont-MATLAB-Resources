% secondOrderRC.m

% R1 = 4700; % Ohms
% C1 = 47e-9; % nF
% R2 = R1;
% C2 = C1;

R1 = 1000;
R2 = 100000;
C1 = .159e-6;
C2 = 1.59e-9;

% 1st-order cut-off
fc_1st = 1/(2*pi*R1*C1);

% 2nd-order cutoff
fc_2nd = 1/((2*pi)*sqrt(C1*C2*R1*R2));
Q = sqrt(C1*C2*R1*R2) / (C1*R1+C2*R1+C2*R2);

w = 2*pi*[20:20000];
s = 1j * w;
H = 1 ./ (s.^2 * (R1*R2*C1*C2) + s.*(R1*C2+R1*C1+R2*C2) + 1);

subplot(2,1,1)
semilogx(w/(2*pi),20*log10(abs(H)));
axis([20 20000 -60 5])
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB');
subplot(2,1,2)
semilogx(w/(2*pi),angle(H) * 180/pi);
axis([20 20000 -180 0])
xlabel('Frequency (Hz)'); ylabel('Phase (deg)');