%% systemNull.m
% Zachary Miller
% 1 April 2024

clear; clc; close all;

[vocal,Fs] = audioread('Vocal.wav');
[convLexicon] = audioread('Vocal_Lexicon.wav');
[convMaag] = audioread('Vocal_MaagAirband20kHz.wav');

N = length(vocal); % length of all files

nullEQ = vocal_EQ - PTVocal_EQ; 
subplot(2,1,1); plot(nullEQ); title('EQ Null Test');
axis([0 N -1 1]);
nullDelay = vocal_ModDelay - PTVocal_ModDelay; 
subplot(2,1,2); plot(nullDelay); title('Delay Null Test');
axis([0 N -1 1]);