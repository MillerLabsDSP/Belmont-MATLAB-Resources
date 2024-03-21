x = linspace(1,15,15);
yhigh = [84 86 90 89 92 87 85 85 85 86 87 87 88 88 87];
ylow = [70 73 71 72 71 66 65 66 67 68 67 68 67 68 68];
plot(x,yhigh,'r-');
hold on;
plot(x,ylow,'b-')
xlabel('Day');
ylabel('Temperature (Fahrenheit)');
title('Weather Forecast');
subtitle('15-day');
legend('Highs','Lows');
grid on;
axis([1 15 65 95])