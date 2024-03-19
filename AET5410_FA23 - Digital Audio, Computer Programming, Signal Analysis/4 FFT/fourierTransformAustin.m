%% fourierTransformAustin.m

Fs = 4800;
Ts = 1/Fs;
t = [0:Ts:1-Ts].';
f = 100;
Nyq = Fs/2;

% Arbitrary ampl and phase shift
x = 0.5 * cos(2*pi*f*t + 0.12345);
N = length(x);

% Inner product vector for cosine and sine transform
Xs = zeros(N,1); Xc = zeros(N,1);

% Variable 'k' for frequency
for k=0:N-1

    % Convert bins 'k' to frequencies in Hz
    f = (k*Fs) / N;

    % Cosine transform
    pc = cos(2*pi*f*t);
    Xc(k+1,1) = x.' * pc;

    % Sine transform
    ps = -sin(2*pi*f*t);
    Xs(k+1,1) = x.' * ps;

end

a = (2/N) * Xc(101,1); % 100 Hz is the focus
b = (2/N) * Xs(101,1);

amp = sqrt(a^2 + b^2);
phase = atan(b/a);

plot(Xc);