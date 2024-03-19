Fs = 64;
Ts = 1 / Fs;

t = [0:Ts:1-Ts].';
f = 4;
x = square(2*pi*f*t);
N = length(x);

% Harmonics = f * 1, 3, 5, 7, 9...
harmNum = 3;
h = f * harmNum;

p = sin(2*pi*h*t);
y = sum(x .* p);
y = x.' * p;

X = zeros((Fs/2),1);

for f=0:(Fs/2)

    p = sin(2*pi*f*t);

    X(f+1,1) = x.' * p;

end

for n=1:Nyq
    f = f * n;
end

% Decibels amp, linear freq
plot(f,20*log10(X));