% userCorrelation.m
% Austin James
clc; clear; close all;

% This is a script you should use for 
% Problem 3 in order to verify the performance
% of your solution. Make sure your code
% can automatically adjust to signals of different
% lengths. 

% Your code should create two array variables:
% r = correlation function
% l = lag values

% Example vectors from test
x = [2 ; -1 ; 1 ; -2 ; 4];
y = [1 ; 3 ; -2 ; -1 ; 1.5];


% Alternative input signals
% x = randn(10,1);
% y = randn(10,1);

% ADD YOUR CODE HERE:

% Intialization of variables
lenX = length(x);
r = zeros((2*lenX)-1,1);
l = (-lenX+1:lenX-1);


for n = 1:(2*lenX)-1 % Loop to run 2n-1 times
    
    if(l(n) < 0) % Conditional to see where the lag time is 

        paddedSignal = [zeros(lenX-n,1) ; y(1:n,1)]; % Padding 0's signal with zeros in the beginning
        r(n,1) = x' * paddedSignal; % Calculating the userCorrelation, and transposing signal 'x'

        elseif(l(n) == 0) % No padding of the signal

            paddedSignal = y; 
            r(n,1) = x' * paddedSignal; 

    else % Padding 0's at the end of the signal

            paddedSignal =[y(l(n)+1:end); zeros(l(n),1)];
            r(n,1) = x' * paddedSignal; 

    end

end

% REVERSING ARRAY TO MATCH WITH RESULTS FROM XCORR
r = r(end:-1:1,1);


% Make sure your result matches the built-in function
[R,L] = xcorr(x,y);

