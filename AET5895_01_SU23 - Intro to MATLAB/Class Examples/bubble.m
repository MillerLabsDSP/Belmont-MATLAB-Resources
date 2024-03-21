function N = bubble(vec)

N=length(vec);

for i=1:N-1
    for j=1:N-i
        if vec(j)>vec(j+1)
            temp=vec(j);
            vec(j)=vec(j+1);
            vec(j+1)=temp;
        end
    end
end

disp(vec);