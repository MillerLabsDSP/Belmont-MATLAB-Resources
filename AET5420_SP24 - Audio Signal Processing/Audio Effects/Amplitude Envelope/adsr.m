% ADSR
% This fucntion can be used to apply an
% ADSR envelop on to an input signal.
%
% Input variables:
% attackTime : length of atack ramp in ms
% decayTime : length of decay ramp in ms
% sustainAmplitude : linear amplitdue of sustain segment
% releasaeTime : length of release ramp in ms

function [y] = adsr(x,Fs,attackTime,decayTime, ...
    sustainAmplitude,releaseTime)

    % Convert time inputs to milliseconds
    attackTimeS = attackTime / 1000;
    decayTimeS = decayTime / 1000;
    releaseTimeS = releaseTime / 1000;

    % Convert seconds to samples and determine sustain time
    a = round(attackTimeS * Fs); % Round each to an integer
    d = round(decayTimeS * Fs); % number of samples
    r = round(releaseTimeS * Fs);
    s = length(x) - (a+d+r); % Determine length of sustain

    aFade = linspace(0,1,a)';
    dFade = linspace(1,sustainAmplitude,d)';
    sFade = sustainAmplitude * ones(s,1);
    rFade = linspace(sustainAmplitude,0,r)';

    adsr = [aFade;dFade;sFade;rFade];
    plot(adsr);
    title('Envelope')
    y = x .* adsr;

end