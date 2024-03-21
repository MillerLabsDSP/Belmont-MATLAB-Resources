% Final Exam Study Guide Q5

xP1 = input('Input Point 1 (x): ');
yP1 = input('Input Point 1 (y): ');
xP2 = input('Input Point 2 (x): ');
yP2 = input('Input Point 2 (y): ');
xP3 = input('Input Point 3 (x): ');
yP3 = input('Input Point 3 (y): ');

% P1 = [xP1,yP1];
% P2 = [xP2,yP2];
% P3 = [xP3,yP3];

negxP1 = xP1 * -1;
negxP2 = xP2 * -1;
negxP3 = xP3 * -1;

plot(xP1,yP1,'k*','DisplayName','P1')
hold on;
plot(xP2,yP2,'k*','DisplayName','P2')
hold on;
plot(xP3,yP3,'k*','DisplayName','P3')
hold on;
plot(negxP1,yP1,'ro','DisplayName','-P1')
hold on;
plot(negxP2,yP2,'ro','DisplayName','-P2')
hold on;
plot(negxP3,yP3,'ro','DisplayName','-P3')
hold on;
legend

xlabel('x-axis');
ylabel('y-axis');
title('Plot');
grid on;