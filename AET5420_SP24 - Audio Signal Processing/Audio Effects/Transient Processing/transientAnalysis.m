%% transientAnalysis.m
% Zachary Miller
% 7 March 2024

% From Hack Audio (Ch. 17)

clear; clc; close all;

[in,Fs] = audioread('AcGtr.wav');

% Gain smoothing/feedback parameters
gFast = 0.9991;
gSlow = 0.9999;
fbFast = 0;
fbSlow = 0;

N = length(in);
envFast = zeros(N,1);
envSlow = zeros(N,1);
transientShaper = zeros(N,1);

for n=1:N

    envFast(n,1) = (1-gFast) * 2 * abs(in(n,1)) + gFast * fbFast;
    fbFast = envFast(n,1);

    envSlow(n,1) = (1-gSlow) * 3 * abs(in(n,1)) + gSlow * fbSlow;
    fbSlow = envSlow(n,1);

    transientShaper(n,1) = envFast(n,1) - envSlow(n,1);

end

figure(1);
plot(envFast); hold on;
plot(envSlow);
plot(transientShaper);
hold off;
legend({'$\alpha$ = 0.9991','$\alpha$ = 0.9999', ...
    'envFast - envSlow'}, 'Interpreter','latex','FontSize',14);
axis([1 N -0.5 1]);

attack = zeros(N,1);
sustain = zeros(N,1);

for n=1:N
    
    if transientShaper(n,1) > 0

        attack(n,1) = transientShaper(n,1) + 1;
        sustain(n,1) = 1;

    else

        attack(n,1) = 1;
        sustain(n,1) = transientShaper(n,1) + 1;
    
    end

end

figure(2);
subplot(2,1,1);
plot(attack); title('Attack Envelope','FontSize',14);
axis([1 N 0.5 1.5]);
subplot(2,1,2);
plot(sustain); title('Sustain Envelope','FontSize',14);
axis([1 N 0.5 1.5]);