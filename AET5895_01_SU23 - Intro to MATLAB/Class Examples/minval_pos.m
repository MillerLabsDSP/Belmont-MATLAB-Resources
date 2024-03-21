function [val,pos] = minval_pos(vec)

val=999; N=length(vec);

for i=1:N
    if val > vec(i)
        val = vec(i);
        pos = i;
    end
end

disp(val); disp(pos);