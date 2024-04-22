%% osLimiter.m
% Zachary Miller
% 18 April 2024

function [out] = osLimiter(x,Fs,inputGain,threshold,attackMs,releaseMs,holdMs,rate)

% This function reads a mono audio file and prompts the user to define parameters
% for a limiter with 2x oversampling functionality. The results are plotted
% and can be played back for comparison.

    % ----------------------------------------------------
    % x = signal
    % Fs = sample rate
    % threshold = maximum signal amplitude allowed [0-1]
        % 1 --> no processing
        % 0 --> maximum processing
    % attack = front end of limiter envelope (ms)
    % release = back end of limiter envelope (ms)
    % hold = sustain of limiter envelope (ms)
    % rate = oversamples input (only takes 2x)
    % ----------------------------------------------------
                            
                        % --------------- %
                        %   Oversampler   %
                        % --------------- %

    N = length(x);

    if (rate == 2)
        outputLen = N*rate;
        y = zeros(outputLen+1,1); n = 1;  

        % Stretch old signal
        for m=1:rate:outputLen
            y(m,1) = x(n,1);
            n = n + 1;
        end
        
        % Interpolate new samples
        buffer = zeros(rate+1,1); M = length(y);
        for m=1:M
            buffer = [buffer(2:end,1); y(m,1)];
            if (mod(m,3) == 0) && (m <= 3)
                y(m-1,1) = mean([buffer(1,1) buffer(3,1)]);
            elseif (mod(m,2) == 1) && (m > 3)
                y(m-1,1) = mean([buffer(1,1) buffer(3,1)]);
            end
        end
        
        x = y(1:length(x)*rate,1); % resize and process in place
            
    end

                        % ----------- %
                        %   Limiter   %
                        % ----------- %

    % If oversampled, "x" is oversampled version of input
    N = length(x);
    
    attackSamples = attackMs*0.001*Fs;
    releaseSamples = releaseMs*0.001*Fs;
    releaseSlew = 1/(releaseSamples + 1);
    holdSamples = (holdMs*0.001)*Fs;

    xGain = x .* inputGain;
    
    y = zeros(N,1); gain = y; relEnvelope = y;
    for n=1:N
    
        sample = xGain(n,1);
    
        % Hard clip module 
        if (abs(sample) > threshold)
            gain(n,1) = threshold/abs(sample);
        else
            gain(n,1) = 1;
        end    
    
    end

    % NOTE: "x .* gain" --> hard clipped signal
    
    % Moving minimum (entire signal)
    M_window = attackSamples + holdSamples;
    M = movmin(gain,M_window);
    
    % Release module
    output = 1;
    for n=1:N
        output = output + ((M(n,1) - output) * releaseSlew);
        output = min(output, M(n,1));
        relEnvelope(n,1) = output;
    end
    
    % FIR filter envelope smoothing
    order = 1;
    if (mod(attackSamples,2) == 0)
        attackSamples = round(attackSamples - 1);
    else
        attackSamples = round(attackSamples);
    end
    smoothEnv = sgolayfilt(relEnvelope,order,attackSamples); % Savitzky-Golay filter
    
    % Combine parallel paths
    out = xGain .* smoothEnv;

    % Resample (if needed)
    if (rate == 2)
        out = resample(out,1,rate); % process in place
    end

    figure(1);
    plot(gain); axis([0 N 0 1]); hold on;
    plot(M); plot(smoothEnv); hold off;
    legend('Gain reduction', 'Moving minimum envelope', 'Smoothed moving minimum');
    
    % Normalize
    outNorm = out / max(out);
    
    figure(2);
    subplot(2,1,1); plot(x); axis([0 N -1 1]);
    xlabel('Time'); ylabel('Amplitude');
    title('Unprocessed');
    subplot(2,1,2); plot(outNorm); axis([0 length(out) -1 1]);
    xlabel('Time'); ylabel('Amplitude');
    title('Limited and normalized');
   
end
