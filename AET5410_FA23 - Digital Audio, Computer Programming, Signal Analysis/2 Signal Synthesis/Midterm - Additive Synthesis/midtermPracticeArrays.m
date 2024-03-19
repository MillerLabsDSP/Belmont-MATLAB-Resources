%% AET5410 Midterm Practice
% Zachary Miller
% Array manipulation

clear; clc;

x = [3 6 9; 1 4 13; 2 8 11];

% y1 = [3 6 9];
y1 = x(1,:);
disp(y1);
% y2 = [1 4; 2 8];
y2 = x(2:3,1:2);
disp(y2);
% y3 = [3 9; 1 13];
y3 = [x(1:2,1),x(1:2,3)];