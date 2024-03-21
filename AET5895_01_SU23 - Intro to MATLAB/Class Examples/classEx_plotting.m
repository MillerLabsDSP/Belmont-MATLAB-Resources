x=linspace(0,2*pi,10);
y=sin(x);
y2=cos(x);
plot(x,y,'b-*');
hold on;
plot(x,y2,'r:*')
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of sin(x)');
legend('sin(x)','cos(x)');
grid on;