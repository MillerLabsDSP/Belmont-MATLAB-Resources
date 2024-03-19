%% stepResponse.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; close all;

Fs = 48000; 
sec = 1; % Time length in seconds
n = sec*Fs; % Convert seconds to # of samples

% Different gain smoothing values
gains = [0.999;0.9995;0.9997;0.9999];

for element = 1:length(gains)
    alpha = gains(element,1);
    b = [(1-alpha)];
    a = [1,-alpha];
    [h,t] = stepz(b,a,n,Fs);
    plot(t,h); hold on;
end

hold off; axis([0 sec -0.1 1.1]); xlabel('Time (sec.)');
AX = legend('.9990','.9995','.9997','.9999'); set(AX,'FontSize',12);