mat = zeros(4,3,5);
i=0; j=0; k=0;

for l=12:6:30
    i=i+1;
    for w=4:2:8
        j=j+1;
        for d=1:0.5:3
            k=k+1;
            mat(i,j,k) = board_feet(l,w,d);
        end
        k=0;       
    end
    j=0;
end


disp(mat);
