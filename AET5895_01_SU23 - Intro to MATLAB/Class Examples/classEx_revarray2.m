v = [17,25,5,33,3,32,35,18,6];

valsrev = zeros(1,9);

for i = 9:-1:1
    valsrev(1,i) = v(1,(10-i));
end

disp(v); disp(valsrev);