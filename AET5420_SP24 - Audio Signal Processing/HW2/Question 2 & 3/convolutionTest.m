% convolutionTest.m
% 
% Use this script to test your function for 
% Homework 2
clear; clc; close all;

% % Short arrays
a = [ 1 ; 2 ; 3 ; 4 ; 1];
b = [5; -2; -5];

% % Check command window to verify
myFunction = userConv(a,b)
myFreq = convFreq(a,b)
builtIn = conv(a,b)

% Test signal
Fs = 4800; Ts = 1/Fs;
f = 10;
t = [0:Ts:.1].';
x = sin(2*pi*f*t);
h = [1; zeros(Fs*0.25,1); 0.5; zeros(Fs*0.25,1); 0.25];

% Plot Result of User Function
y1 = userConv(x,h);
subplot(2,1,1)
plot(y1); title('User Function');

% Plot Result of Frequency Domain Function
y2 = convFreq(x,h);
subplot(2,1,2)
%y2 = conv(x,h); % May also want to check this
plot(y2); title('Frequency Domain');