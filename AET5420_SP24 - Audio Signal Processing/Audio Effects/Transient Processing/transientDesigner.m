% transientDesigner.m
% Zachary Miller
% 7 March 2024

% From Hack Audio (Ch. 17)

function [out] = transientDesigner(in,Fs,attack,sustain)
    
    N = length(in);
    gFast = 0.9991;
    gSlow = 0.9999;
    fbFast = 0;
    fbSlow = 0;
    envFast = zeros(N,1);
    envSlow = zeros(N,1);
    differenceEnv = zeros(N,1);

    for n=1:N

    envFast(n,1) = (1-gFast) * 2 * abs(in(n,1)) + gFast * fbFast;
    fbFast = envFast(n,1);

    envSlow(n,1) = (1-gSlow) * 3 * abs(in(n,1)) + gSlow * fbSlow;
    fbSlow = envSlow(n,1);

    differenceEnv(n,1) = envFast(n,1) - envSlow(n,1);

    % NOTE: The difference envelope will have a positive
    % value when envFast is greater than envSlow. This
    % occurs when the signal is in "attack" mode. If the
    % difference envelope is negative, then the signal is
    % in "sustain" mode.

    end

    attEnv = zeros(N,1);
    susEnv = zeros(N,1);

    for n=1:N

        if differenceEnv(n,1) > 0 % attack mode

            attEnv(n,1) = (attack * differenceEnv(n,1)) + 1;
            susEnv(n,1) = 1; % no change

        else % sustain mode

            attEnv(n,1) = 1; % no change
            susEnv(n,1) = (sustain * -differenceEnv(n,1)) + 1;
        end

    end

    % Apply the attack and sustain envelopes
    out = (in .* attEnv) .* susEnv;

end