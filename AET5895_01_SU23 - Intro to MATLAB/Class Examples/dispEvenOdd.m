for i=1:10
    n = input("Input an integer: ");
    
    if(mod(n,2)==0)
        disp("even")
    elseif(mod(n,2)==1)
        disp("odd")
    else
        disp("error")
    end
end
