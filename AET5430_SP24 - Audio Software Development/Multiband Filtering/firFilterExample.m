%% firFilterExample.m
% Zachary Miller
% 2 March 2024

clear; clc; close all;

ord = 46;

low = 0.4;
bnd = [0.6 0.9];

bM = fir1(ord,[low bnd]);
[hbM,f] = freqz(bM,1);

bW = fir1(ord,[low bnd],"DC-1");

[hbW,~] = freqz(bW,1);
plot(f/pi,mag2db(abs(hbM)),f/pi,mag2db(abs(hbW)))
legend("bM","bW",Location="best")
ylim([-50 5])
grid