Fs = 100;
x = (0:Fs-1)/Fs;
y1 = sin(2*pi*5*t);
y2 = 0.8*sin(2*pi*3*t);
plot(x,y1,'k-');
hold on;
plot(x,y2,'b-')
xlabel('Time');
ylabel('Amplitude');
title('Plot of sinusoids');
legend('y1','y2');
grid on;