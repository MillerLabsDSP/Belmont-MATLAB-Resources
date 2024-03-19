%% linAmpPlot.m
% Zachary Miller
% 25 Feb 2024

function [y] = linAmpPlot(x,Fs)
    
    N = length(x);
    Ts = 1/Fs;
    t = [0:Ts:(N/Fs)-Ts].';

    % Plot input
    subplot(3,1,1)
    plot(t,x);
    title('Waveform: x[n]')
    ylabel('Amplitude')
    axis([0 N/Fs -1 1])

    % Plot full-wave rectification
    x = abs(x);
    subplot(3,1,2)
    plot(t,x);
    title('Full-wave rectification: abs(x[n])')
    ylabel('Amplitude')
    axis([0 N/Fs -1 1])

    alpha = 0.9995; % [0.9990 - 0.9999]
    y = zeros(N,1);
    
    % LPF
    for n=1:N
        if (n == 1)
            y(n,1) = 0;
        else
            y(n,1) = (1 - alpha) * x(n,1) + alpha * y(n-1,1);
        end
    end

    y = 20*log10(y); % lin to dB

    subplot(3,1,3)
    plot(t,y)
    title('Amplitude envelope: ~x[n]')
    xlabel('Time (sec.)'); ylabel('Amplitude');
    axis([0 N/Fs -60 0])

end