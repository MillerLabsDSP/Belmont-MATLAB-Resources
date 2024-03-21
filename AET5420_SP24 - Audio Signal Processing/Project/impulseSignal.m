%% impulseSignal
% Zachary Miller, Alek Weidman, John Sweeney

clear; clc; close all;

% Synthesize impulse (~1sec)
Fs = 48000;
impulse = [1;zeros(Fs-1,1)];

audiowrite('ImpulseResponse_48k.wav',impulse,Fs);