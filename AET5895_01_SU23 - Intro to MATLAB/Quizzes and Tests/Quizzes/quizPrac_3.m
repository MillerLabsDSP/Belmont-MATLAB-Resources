posVal = input('Input positive value: ');
newVal=1; fac=1;

while(posVal<1)
    disp('Not a positive integer.')
    posVal = input('Input positive value: ');
end

for posVal=posVal:-1:1
        newVal = posVal;
        fac = newVal * fac;
end

disp('Factorial = ');
disp(fac);

