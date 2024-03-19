%% basicComp.m
% Zachary Miller
% 29 Feb 2024

% Hack Audio (Ch. 18)

clear; clc; close all;

% Step input signal
% Fs = 48000; Ts = 1/Fs;
% x = [zeros(Fs,1); ones(Fs,1); zeros(Fs,1)];
% N = length(x);

% % Audio input signal
[x,Fs] = audioread('AcGtr.wav');
Ts = 1/Fs; N = length(x);
Nsec = N/Fs;

% Compressor parameters
T = -30; % threshold (dBFS)
R = 4; % ratio (R:1)
responseTime = 0.25; % in seconds
alpha = exp(-log(9)/(Fs * responseTime));
gainSmoothPrev = 0; % initialize smoothing variable

y = zeros(N,1);
lin_A = zeros(N,1);

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
    
    % Smooth over gainChange_dB to alter response time
    gainSmooth = ((1-alpha)*gainChange_dB) + (alpha*gainSmoothPrev);
    
    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);
    
    % Apply linear amplitude from detection path to input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    
    % Update gainSmoothPrev used in the next sample of the loop
    gainSmoothPrev = gainSmooth;

end
t = [0:N-1]*Ts; t = t(:);

% For step input
% subplot(3,1,1);
% plot(t,x); title('Step Input'); axis([0 3 -0.1 1.1]);
% subplot(3,1,2);
% plot(t,y); title('Compressor Out'); axis([0 3 -0.1 1.1]);
% subplot(3,1,3);
% plot(t,lin_A); title('Gain Reduction'); axis([0 3 -0.1 1.1]);

% For audio input
subplot(2,1,1);
plot(t,x); hold on; title('Input'); axis([0 Nsec -1.1 1.1]);
plot(t,y); axis([0 Nsec -1.1 1.1]); legend('Compressor Input','Compressor Output'); 
ylabel('Amplitude (peak-to-peak'); hold off;
subplot(2,1,2);  
plot(t,lin_A); title('Gain Reduction'); axis([0 Nsec 0 1.1]);
xlabel('Time (sec.)'); ylabel('Amplitude');