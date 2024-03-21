mat = [33 -11 2; 4 0 9; 22 3 -7; -6 17 3];

for i=1:4
    newSum=0;
    for j=1:3
        if (mat(i,j)>0)
           newValue = mat(i,j);
           newSum = newValue + newSum;
        end
    end
    disp(newSum);
end
