minval = 1000;
minloc = 0;

vals  = randi(99,1,7);

for i = 1:7
    newval = vals(i);
    if(newval < minval)
        minval = vals(i);
        minloc = i;
    end
end

disp(vals);
fprintf('Minimum = %2.0f at index %d.\n', minval, minloc);

maxval = 0;
maxloc = 0;

for i = 1:7
    newval = vals(i);
    if(newval > maxval)
        maxval = vals(i);
        maxloc = i;
    end
end

fprintf('Maximum = %2.0f at index %d.\n', maxval, maxloc);