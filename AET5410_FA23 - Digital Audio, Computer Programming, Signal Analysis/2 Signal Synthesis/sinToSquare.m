% sinToSquare

clear; clc;

Fs = 48000;
Fc = 5;
dt = 1/Fs;
t = 0:dt:1-dt;

subplot(2,1,1);
sw = sin(2*pi*Fc*t)';
N = length(sw);
plot(sw);

subplot(2,1,2)
sqr = zeros(N,1);

for i=1:N
    if (sw(i,1) >= 0)
        sqr(i,1) = 1;
    else
        sqr(i,1) = -1;
    end
end

plot(sqr);