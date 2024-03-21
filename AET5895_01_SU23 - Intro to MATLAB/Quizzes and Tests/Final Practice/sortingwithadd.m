% Final Exam Study Guide Q2_1_1

function [N,newvec] = sortingwithadd(vec,newval)

newvec = [newval vec];
N=length(newvec);

for i=1:N-1
    for j=i+1:N
        if newvec(j)<newvec(i)
            temp=newvec(j);
            newvec(j)=newvec(i);
            newvec(i)=temp;
        end
    end
end

disp(vec);
disp(newvec);