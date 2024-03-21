% Zachary Miller
% Intro to MATLAB: Final Exam (Part 1.1)

% Function to convert rectangular coordinates to polar coordinates

function [M,theta] = rect2polar(x,y)
    M = sqrt((x^2)+(y^2));
    theta = rad2deg(atan(y/x));
end