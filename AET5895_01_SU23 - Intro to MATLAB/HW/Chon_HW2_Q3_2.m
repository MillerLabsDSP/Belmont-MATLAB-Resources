% Zachary Miller
% HW2, Q3
% 7/19/23

num = input('Input a number: ');
k = input('Input number of rounded decimal places: ');

round = roundToDecPlaces(num,k);
fprintf('%g\n', round);