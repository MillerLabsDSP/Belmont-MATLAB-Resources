a = [1; 2; 3; 4; 5; 6];
b = zeros(30,1);
n = 1; j = 2;

for i=1:6
    b(n) = a(i);
    b(j) = b(n);
    n = n + 2;
    j = j + 2;
end

disp(b);