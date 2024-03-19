%% Additive Synthesis (Midterm)
% Zachary Miller
% 1 Nov 2023

Fs = 48000;                 % sampling rate
Ts = 1/Fs;                  % sampling period
f = 100;                      % fundamental frequency
M = floor(Fs/(2*f));        % total # of harmonics

StopTime = 1;               % length of signal (s)
t = [0:Ts:StopTime-Ts]';    % time domain (s)

x = sin(2*pi*f*t);          % sine wave synthesis
N = length(x);
% plot(t,x);

addSig = zeros(N,1);        % new array to build signals on       

for i=1:M                                         % loop for 240 (M) iterations
    newSig = (1/i) * sin(2*pi*(f*i)*t);           % sawtooth computation
    addSig = [addSig+newSig];                     % sawtooth summation
end

sawtoothSig = (2/pi) .* addSig;                   % final computation of sawtooth wave

plot(t,sawtoothSig);                              % plot (s)
sound(sawtoothSig,48000);                       % playback (48kHz)
% audiowrite('sawtooth.wav',sawtoothSig,48000);   % write to WAV file