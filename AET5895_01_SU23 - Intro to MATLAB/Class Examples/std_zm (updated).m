function all = std_zm(vec)

new_vec=zeros(1,10); i=1;

    for i=i:10
        new_vec(1,i)=(vec(1,i)-mean_zm(vec))^2;
    end

all=sqrt(sum(new_vec)/length(new_vec));

end