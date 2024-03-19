% summing.m
% Zachary Miller
% 30 Oct 2023

% a = [2; 3; 4];
% b = [5; 6; 7];

% Element-wise addition
for n = 1:length(a)

    c(n,1) = a(n,1) + b(n,1);

end

disp(c);

% Similarly
c = a + b;
disp(c);

Fs = 48000;
Ts = 1/Fs;
N = 48000;
t = [0:N-1]' * Ts;
f1 = 200;
f2 = 500;

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);

y = x1 + x2;
plottf(y,Fs);