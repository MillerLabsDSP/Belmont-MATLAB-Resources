% overlapConvolution.m
% Zachary Miller
% 12 March 2024

%% Robert Elder: Overlap-Add and Overlap-Save Visualization
% https://blog.robertelder.org/overlap-add-overlap-save/
%%

clear; clc; close all;

x = [3 -1 0 3 2 0 1 2 1].'; % input
h = [1 -1 1].'; % response

% Reference test
test = conv(x,h);

M = length(h);

% Frame size for "x"
L = M;

% FFT size
N = L+M-1;

% Calculate spectrum of "h" before audio processing
h = [h;zeros(N-M,1)];
H = fft(h);

% Offline version (entire input known)
strt = 1; % starting sample of "x"
y = zeros(length(x)+M-1,1); % full length of "x" plus "h" tail

while (strt+L-1 <= length(x))

    xF = [x(strt:strt+L-1,1);zeros(N-L,1)];
    X = fft(xF);
    Y = X .* H;
    yF = real(ifft(Y));

    y(strt:strt+N-1,1) = y(strt:strt+N-1,1) + yF; % add

    strt = strt + L;

end

[test,y] % test outputs

% Real-time version (per sample)

% count = 1;
% buffer = zeros(L,1); % input buffer
% outBuffer = zeros(N,1);
% y = zeros(length(x)+M-1,1);
% for n=1:length(x)
% 
%     sample = x(n,1); 
%     buffer = [buffer(2:end,1);sample];
% 
%     if (count == L)
%         % FFT calc
%         xF = [buffer;zeros(N-L,1)];
%         X = fft(xF);
%         Y = X .* H;
%         yF = real(ifft(Y));
%         outBuffer = outBuffer + yF; % overlap add
%         out = outBuffer(1,1); % use first sample for output
%         outBuffer = [outBuffer(2:end,1);0]; % shift buffer
%         count = 1;
%     else
%         % Wait to do FFT calc
%         out = outBuffer(1,1);
%         outBuffer = [outBuffer(2:end,1);0];
%         count = count + 1;
%     end
% 
%     y(n,1) = out;
% 
% end