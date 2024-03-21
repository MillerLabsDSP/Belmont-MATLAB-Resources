posVal=input('Input positive value: ');
facVal=1;

while(posVal<1)
    disp('Not a positive integer.')
    posVal = input('Input positive value: ');
end

if (mod(posVal,2)==0)
    newVal=posVal-1;
else
    newVal=posVal;
end

for newVal=newVal:-2:1
        a=newVal;
        facVal=a*facVal;
end

disp('Factorial = ');
disp(facVal);




    