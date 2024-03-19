% transientExample.m
% Zachary Miller
% 7 March 2024

% From Hack Audio (Ch. 17)

clear; clc; close all;

[in,Fs] = audioread('AcGtr.wav');

% Attack/sustain parameters [-1,+1]
attack = 1;
sustain = -1;

out = transientDesigner(in,Fs,attack,sustain);

plot(out,'r'); hold on;
plot(in,'b'); hold off;
legend({'Output','Input'},'FontSize',14);

% sound(out,Fs);