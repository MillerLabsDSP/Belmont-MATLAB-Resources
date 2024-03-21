b = [1,2,3; 4,5,6];
sum1=0; sumTotal=0;

for i=1:2
    sum1=sum1+b(i,2);
    for j=1:3
        sumTotal=sumTotal+b(i,j);
    end
end

disp(sumTotal);

% Summation check

sumTotal_2=sum(sum(b));
disp(sumTotal_2);