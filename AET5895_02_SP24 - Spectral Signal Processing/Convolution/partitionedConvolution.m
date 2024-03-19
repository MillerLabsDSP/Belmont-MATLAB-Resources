%% partitionedConvolution
% Zachary Miller
% 13 March 2024

clear; clc; close all;

x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2].';

test = conv(x,h); % test

% Split into equal partitions (aka uniform partitions)
h1 = h(1:2,1); 
h2 = h(3:4,1);

y1 = conv(x,h1);
y2 = conv(x,h2);

y1 = [y1;zeros(2,1)];
y2 = [zeros(2,1);y2];

y = y1 + y2;

% [test,y];

%% Non-uniform partitions
x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2 1 -1].';

test = conv(x,h); % test

h1 = h(1:2,1); 
d1 = length(h1);
h2 = h(3:6,1);
d2 = length(h2);

y1 = conv(x,h1);
y2 = conv(x,h2);

y1 = [y1;zeros(d2,1)];
y2 = [zeros(d1,1);y2];

y = y1 + y2;

% [test,y];

%% Real-time partitioned convolution 
x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2 1 -1].';

test = conv(x,h); % test

h1 = h(1:2,1); M1 = length(h1);
h2 = h(3:6,1); M2 = length(h2);

x = [x;zeros(length(h)-1,1)];

N = length(x);
buffer1 = zeros(M1,1);
buffer2 = zeros(M2,1);
outBuffer = zeros(M1,1);
out = zeros(N,1);
for n=1:N

    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    buffer2 = [x(n,1);buffer2(1:end-1,1)];
    y1 = 0;
    for m=1:M1
        y1 = y1 + buffer1(m,1) * h1(m,1);
    end

    y2 = 0;
    for m=1:M2
        y2 = y2 + buffer2(m,1) * h2(m,1);
    end

    % Need to delay y2 by M1 samples
    y = y1 + outBuffer(end,1);
    outBuffer = [y2;outBuffer(1:end-1,1)];

    out(n,1) = y;
end

%% Same method, move the delay block up front

buffer1 = zeros(M1,1);
buffer2 = zeros(M2,1);
for n=1:N

    buffer2 = [buffer1(end,1);buffer2(1:end-1,1)];
    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    y1 = 0;
    for m=1:M1
        y1 = y1 + buffer1(m,1) * h1(m,1);
    end

    y2 = 0;
    for m=1:M2
        y2 = y2 + buffer2(m,1) * h2(m,1);
    end

    y = y1 + y2;
    out(n,1) = y;

end

% [test,out]

%% Uniform partitioned FFT convolution

clear; clc; close all;

x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2].';

test = conv(x,h);

M = length(h);

h1 = h(1:2,1); M1 = length(h1); % length of partition
h2 = h(3:4,1);

H1 = fft([h1;zeros(M1,1)]); % maintain lengths as powers of 2
H2 = fft([h2;zeros(M1,1)]);

buffer1 = zeros(M1,1);
buffer2 = zeros(M1,1);
outBuffer = zeros(2*M1,1);

x = [x;zeros(M,1)];
N = length(x);
y = zeros(N,1);
for n=1:N
    
    buffer2 = [buffer2(2:end,1);buffer1(1,1)];
    buffer1 = [buffer1(2:end,1);x(n,1)];

    if (mod(n,M1) == 0)
        
        % FFT
        x1F = [buffer1;zeros(M1,1)];
        X1 = fft(x1F);
        Y1 = X1 .* H1;
        x2F = [buffer2;zeros(M1,1)];
        X2 = fft(x2F);
        Y2 = X2 .* H2;

        % IFFT
        yF = real(ifft(Y1)) + real(ifft(Y2));
        outBuffer = outBuffer + yF;
    end

    y(n,1) = outBuffer(1,1);
    outBuffer = [outBuffer(2:end,1);0];

end

disp(test); disp(y); % latency is equal to one sample less than FFT size

%% Hybrid time+freq domain partitioned convolution

clear; clc; close all;

x = [3 -1 0 3 2 0 1 2 1].';
h = [1 -1 1 -2 -1].';
test = conv(x,h);
M = length(h);

% Time-domain section of IR
h1 = h(1:2,1);
M1 = 2; % length of time-domain IR

% Freq-domain section of IR
h2 = h(3:5,1);
M2 = 3; % length of freq-domain IR
H2 = fft([h2;zeros(M2-1,1)]);

x = [x;zeros(M-1,1)];
N = length(x);

buffer1 = zeros(M1,1);
buffer2 = zeros(M2,1);
outBuffer = zeros(M1+M2,1);
y = zeros(N,1);
for n=1:N

    buffer1 = [x(n,1);buffer1(1:end-1,1)];
    buffer2 = [buffer2(2:end,1);x(n,1)];

    % Time domain
    y1 = 0;
    for m1=1:M1
        y1 = y1 + buffer1(m1,1) * h1(m1,1);
    end

    % Freq domain
    if (mod(n,M2) == 0)
        xF = [buffer2;zeros(M2-1,1)]; % same size as H2
        X = fft(xF); % often bypassed
        Y = X.*H2;
        yF = real(ifft(Y));
        outBuffer = outBuffer + yF;
    end
    y2 = outBuffer(1,1);
    y(n,1) = y1 + y2;
    outBuffer = [outBuffer(2:end,1);0];

end

[test,y]












