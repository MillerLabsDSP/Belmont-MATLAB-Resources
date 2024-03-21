% Final Exam Study Guide Q4b

x=linspace(0,6,60);
y1 = (0.25 * x.^3) - (2 * x.^2) + (3 * x) + 6;
y2 = (-1 * x.^2) + (3 * x) + 2;

plot(x,y1,'b-*');
hold on;
plot(x,y2,'r:*')
xlabel('Input');
ylabel('Output');
title('Plot');
legend('y1','y2');
grid on;