% audioEdits.m
% HW2 - Q1
% Zachary Miller
% 7 Oct 2023

clear; clc;

% Read and plot audio file
filename = 'monoAlphabet2.wav';             
[x,Fs] = audioread(filename);
dt = 1/Fs;
% plot(x);

% Initialize indexes (by samples)
zInitialIndex = x(592000:615999);
iInitialIndex = x(175865:198748);
mInitialIndex = x(264287:285668);

% Pad "initials" indexes
zLength = length(zInitialIndex); % 24000 samples long
iLength = length(iInitialIndex); % 22884 samples long
mLength = length(mInitialIndex); % 21382 samples long

padI = zLength - iLength;
padM = zLength - mLength;

neededZerosI = zeros(1,padI)';
neededZerosM = zeros(1,padM)';
zInitial = zInitialIndex;
iInitial = cat(1,iInitialIndex,neededZerosI);
mInitial = cat(1,mInitialIndex,neededZerosM);


% Concatenate ZIM, initialize reverse file
ZIM = cat(1,zInitial,iInitial,mInitial);
ZIMRev = ZIM(end:-1:1);

% Concatenate "ZIMZIMZIM"
for i=1:2
    ZIM = cat(1,ZIM,zInitial,iInitial,mInitial);
end   

% Final audio edit
finalAudioEdit = cat(1,ZIM,ZIMRev);
plot(finalAudioEdit); 
% sound(finalAudioEdit,44100,16);
audiowrite('audioEdits.wav',finalAudioEdit,44100);
