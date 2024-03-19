%% userCorrelation.m
% Zachary Miller
% 20 Nov 2023
% AET5410

% Example vectors from test
% x = [2 ; -1 ; 1 ; -2 ; 4];
% y = [1 ; 3 ; -2 ; -1 ; 1.5];

% Alternative input signals
x = randn(10,1);
y = randn(10,1);

% ADD YOUR CODE HERE:

N = length(x); 
r = zeros((2*N)-1,1);
l = (-N + 1: N - 1);

lenR = (2 * N) - 1;

xHold = []; % Empty array for x-values 
yHold = []; % Empty array for y-values

yRev = flip(y).'; % Reverse y-values
r = []; % Empty array for cross-correlated values
j=1;

% Cross correlation for "l" values from min to 0
for n=1:ceil(lenR/2)
    xHold = [x(n),xHold]; % Add values to front end
    yHold = [yHold,yRev(n)]; % Add values to back end
    if (length(r)<1) % For empty array at the beginning
        r(n) = xHold .* yHold;
    else
        r(n) = sum(xHold .* yHold);
    end
end

% Cross correlation for "l" values from 1 to max
for i=floor(lenR/2):-1:1
    n=n+1;
    xHold(i+1) = []; % Removes last value of xHold storage array
    yHold(1) = []; % Removes first value of yHold storage array
    if (length(r)<1)
        r(n) = xHold .* yHold;
    else
        r(n) = sum(xHold .* yHold);
    end
end

r = r.';
% disp(l); 
disp(r);

% Make sure your result matches the built-in function
[R,L] = xcorr(x,y);
disp(R);

% Output in command window is my algorithms output 
% followed by the built in function's output.