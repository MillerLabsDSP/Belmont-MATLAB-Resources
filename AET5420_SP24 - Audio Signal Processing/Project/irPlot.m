%% irPLot.m
% Zachary Miller, Alek Weidman, John Sweeney
% 21 March 2024

clear; clc; close all;

[IR,Fs] = audioread('ImpulseResponse_48k.wav');
[hEQ] = audioread('IR_EQ.wav');
[hDelay] = audioread('IR_ModDelay.wav');

% Plot parameters
Ts = 1/Fs;
N = length(hDelay);
t = [0:Ts:(N/Fs)-Ts].'; % time domain in seconds
IR = [IR;zeros(N-length(IR),1)]; % pad
IR(IR == 0) = NaN; hDelay(hDelay == 0) = NaN; % ignore zeros

% Plot log frequency, dB amplitude
[H_EQ,W_EQ] = freqz(hEQ,1,2048,Fs);
                            
% Amplitude plots
figure;
semilogx(W_EQ,20*log10(abs(H_EQ))); % EQ response
axis([20 20000 -25 10]); grid on;

figure; grid off;
stem(t,IR); hold on; % IR reference
stem(t,hDelay); hold off; % Delay response
axis([0 2.5 -1 1]); legend('IR','PT ModDelayIII'); 
xlabel('Time (s)'); ylabel('Amplitude');