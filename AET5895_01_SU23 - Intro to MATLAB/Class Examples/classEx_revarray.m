v = [17,25,5,33,3,32,35,18,6];

valsrev = zeros(1,9);

for i = 1:9
    valsrev(1,(10-i)) = v(1,i);
end

disp(v); disp(valsrev);