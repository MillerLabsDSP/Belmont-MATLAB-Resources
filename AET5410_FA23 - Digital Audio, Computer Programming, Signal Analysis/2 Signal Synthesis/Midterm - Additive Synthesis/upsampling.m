%% Upsampling idea
% Zachary Miller

Fs = 22050;
Ts = 1/Fs;
f = 200;
StopTime = Ts; % seconds
size=4; % segment length
t = [0:Ts:1]';

x = sin(2*pi*f*t);
% sound(x,1000);

% x = [1 2 3 4 5 6 7 8].';

N=length(x); y=zeros(N*size,1); M=length(y); counter=1;

for i=1:N
    y(counter,1) = x(i,1);
    counter=counter+size;
end

plot(y);
sound(y,Fs);