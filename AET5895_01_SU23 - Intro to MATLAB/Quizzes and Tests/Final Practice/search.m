% Final Exam Study Guide Q3_1

function index = search(v,n)

N = length(v); index = [];

    for i=1
        for j=1:N
            if v(1,j) == n
                index = j;
            end
        end
    end

fprintf('\nValue: %g\n', n);
fprintf('Position index: %g\n', index);

end