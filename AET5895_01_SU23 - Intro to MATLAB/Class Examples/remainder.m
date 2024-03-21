clear all

dividend = input('Enter a number: ');
divisor = input('Enter a number: ');

quotient = floor(dividend/divisor);
rem = dividend - (quotient * divisor);
disp(rem);