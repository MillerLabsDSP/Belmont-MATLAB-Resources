% Zachary Miller
% HW2, Q3
% 7/19/23

function round = roundToDecPlaces(num,k)
    round = (floor(num * (10^k) + 0.5)) / 10^k;
end