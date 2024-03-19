%% LPFDemo.m

[x,Fs] = audioread('AcGtr.wav');
N = length(x);

% Feed-forward gain
b0 = 0.1;
b1 = 0.1;

% Feed-back gain
a1 = 0.1;

% LPF difference equation
for n=2:N
    y(n,1) = b0 * x(n,1) + b1 * x(n-1,1) - a1 * x(n-1,1);
end

subplot(2,1,1)
plot(x);
subplot(2,1,2)
plot(y);