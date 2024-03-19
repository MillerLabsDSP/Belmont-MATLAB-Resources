%% realtimeStereoImager.m
% Zachary Miller
% 18 March 2024

% clear; clc; close all;

% [in,Fs] = audioread('stereoDrums.wav');
in = [0.5*ones(10,1),0.3*ones(10,1)];
N = length(in); C = size(in,2);
    
% Width amount
width = 1.5; % wider when > 1, narrower when < 1

buffer = zeros(N,1); % relative to buffer size
y = zeros(N,2);
for c=1:C
    for n=1:N
        if (c == 1)
            buffer(n,1) = in(n,c); % "L"
        else
            mid = 0.5 * (buffer(n,1) + in(n,c));
            side = 0.5 * (buffer(n,1) - in(n,c));

            midNew = (2-width) * mid;
            sideNew = width * side;

            newLeft = midNew + sideNew;
            newRight = midNew - sideNew;

            y(n,c-1) = newLeft;
            y(n,c) = newRight;
        end

    end
end

