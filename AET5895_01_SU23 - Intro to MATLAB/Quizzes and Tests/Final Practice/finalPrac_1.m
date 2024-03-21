% Final Exam Study Guide Q1

year = input('Input a year: ');

if mod(year,400) == 0
    disp('Leap year')
elseif mod(year,4) == 0 && mod(year,100) ~= 0
    disp('Leap year')
else
    disp('Not a leap year')
end