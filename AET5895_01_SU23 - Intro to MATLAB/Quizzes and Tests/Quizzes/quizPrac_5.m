mat=zeros(8,6);
i=1; j=1;

for t=20:5:55
    for v=0:10:50
        mat(i,j)=35.7+(0.6*t)-(35.7*(v^0.16))+((0.43*t)*(v^0.16));
        j=j+1;  
    end
    i=i+1;
    j=1;
end

disp(mat);