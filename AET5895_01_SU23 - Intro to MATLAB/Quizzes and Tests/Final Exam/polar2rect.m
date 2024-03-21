% Zachary Miller
% Intro to MATLAB: Final Exam (Part 1.2)

% Function to convert polar coordinates to rectangular coordinates

function [x,y] = polar2rect(M,theta)
    x = M * cos(theta);
    y = M * sin(theta);
end