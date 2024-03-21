% Final Exam Study Guide Q2_2_1

function N = sortingwithremove(vec,newvalRemove)

N=length(vec);

for i=1
    for j=1:N
        if vec(1,j) == newvalRemove
            vec(:,j) = [];
        end
    end
end

disp(vec);