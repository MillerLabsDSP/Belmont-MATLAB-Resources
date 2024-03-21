clear all
clc

a = zeros(1,10);
for i=1:10
    a(i) = input("Enter a number to add: ");
end

sumTotal = 0;
sumTotal = sum(i);     % sumTotal = sumTotal + a(i); ONLY WORKS WITH 'FOR' LOOP!
avg = sumTotal / 10;

disp("The total is: "), disp(sumTotal);
disp("The average is: "), disp(avg);