% Zachary Miller
% 7/10/23
% Midterm, Q2

for x=1:5                                   % loop for range of x values
    for z=2:6
        y=(x*z)/(x-z);                      % loop for range of y values
        if(x==z)                            % output error message for zero denominator
            disp("Function undefined");
            fprintf("\n")
        else                                % successful output
            disp([x,z,y]);
        end
    end
end