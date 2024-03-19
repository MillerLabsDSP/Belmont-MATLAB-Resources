%% compressor.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

function [y] = compressor(x,Fs,T,R,attackTime,releaseTime)

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

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
    if x_dB > T
        gainSC = T + (x_dB - T)/R;
    else
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
    y(n,1) = lin_A(n,1) * x(n,1);

    % Update gainSmoothPrev for next sample iteration
    gainSmoothPrev = gainSmooth;

end

%% Uncomment for visualization:
t = [0:N-1]/Fs; t = t(:);
subplot(2,1,1);
plot(t,x); title('Input'); axis([0 t(end) -1.1 1.1]);
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 t(end) -1.1 1.1]);
legend('Output Signal','Gain Reduction');