%% MLMBPcomp_peakParallelComp.m
% Zachary Miller
% 29 Feb 2024

function [y] = MLMBPcomp_peakParallelComp(x,Fs,T,R,W,attackTime,releaseTime,blend)

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);
lin_Y = zeros(N,1);

blend = blend/100; % [0-100]

% Initialize separate attack and release times
alphaA = exp(-log(9)/(Fs * attackTime));
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % initialize smoothing variable

% Loop over each sample to check against threshold
for n=1:N

    % Convert input to unipolar signal on dB scale
    x_uni = abs(x(n,1)); 
    x_dB = 20*log10(x_uni);
    
    % Ensure no values of negative infinity
    if x_dB < -96
        x_dB = -96;
    end
    
    % Static characteristics
    if x_dB > (T + W/2)
        % Above knee curve
        gainSC = T + (x_dB - T)/R;
    elseif x_dB > (T - W/2)
        % Within knee curve
        gainSC = x_dB + ...
            ((1/R - 1)*(x_dB - T + W/2)^2)/(2*W);
    else
        % Do not compress
        gainSC = x_dB;
    end
    
    gainChange_dB = gainSC - x_dB;

    % Smooth over the gainChange
    if gainChange_dB < gainSmoothPrev
        % Attack mode
        gainSmooth = ((1-alphaA)*gainChange_dB) ...
            + (alphaA*gainSmoothPrev);
    else
        % Release mode
        gainSmooth = ((1-alphaR)*gainChange_dB) ...
            + (alphaR*gainSmoothPrev);
    end

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);
    
    % Apply linear amplitude to input sample
    lin_Y(n,1) = lin_A(n,1) * x(n,1);

    % Update gainSmoothPrev used in the next iteration
    gainSmoothPrev = gainSmooth;

    % Blend in parallel signal
    y(n,1) = lin_Y(n,1) + blend * x(n,1);

end

%% Uncomment for visualization:
t = [0:N-1]/Fs; t = t(:);
subplot(3,1,1);
plot(t,x); title('Input Signal'); axis([0 7 -1.1 1.1]);
subplot(3,1,2);
plot(t,lin_Y,t,lin_A); title('Output'); axis([0 7 -1.1 1.1]);
legend('Output Signal','Gain Reduction');
subplot(3,1,3);
plot(t,y); title('With parallel comp'); axis([0 7 -1.1 1.1]);