% waveTableSynthesis.m
% Zachary Miller
% 23 Oct 2023

clear; clc;

filename = 'wavetable.wav';
[x,Fs] = audioread(filename);
newSig100 = [];
n=1;

% Concatenate 1s 100Hz tone
for i=1:100
    newSig100 = cat(1,newSig100,x);
end

% audiowrite('wavetable100Hz.wav',newSig100,Fs);

% Resample to 200Hz

for i=1:48000
    if (mod(i,2) == 1)
        newSig200(n,1) = newSig100(i,1);
        n=n+1;
    end
end

% for i=1:2:48000
%         newSig200(n,1) = newSig100(i,1);
%         n=n+1;
% end

newSig200 = [newSig200;newSig200];
audiowrite('wavetable200Hz.wav',newSig200,Fs);

% Resample to 50Hz

newSig50 = size(newSig100,1);

n = 1; j = 2;

for i=1:24000
    newSig50(n,1) = newSig100(i,1);
    newSig50(j,1) = newSig50(n,1);
    n = n + 2;
    j = j + 2;
end
audiowrite('wavetable50Hz.wav',newSig50,Fs);
