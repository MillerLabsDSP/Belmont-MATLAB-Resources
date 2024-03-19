%% hardClip.m
% Zachary Miller
% 22 Jan 2024

function [outputSF] = hardClip(inputSF,thresh)
    for n=1:length(inputSF)
        x = inputSF(n,1);
        if (x > thresh)
            y = thresh;
        elseif (x < -thresh)
            y = -thresh;
        else
            y = x;
        end
        outputSF(n,1) = y;
    end
end