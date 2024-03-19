%% softClip.m
% Zachary Miller
% 29 Jan 2024

function [out] = softClip(in)
for n=1:length(in)
    x = in(n,1);

    y = x - (1/3)*(x)^3 + (1/5)*(x)^5; % power series formula

    out(n,1) = y;
end