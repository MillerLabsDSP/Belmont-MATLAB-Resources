% Zachary Miller
% HW1, Q2

status = input('Input position status (E or M): ', 's');             % Input for employee status    

    while ((status ~= "E") && (status ~= "M"))                       % Input checkpoint (loop) for appropriate status responses
       
       disp('Invalid input error.');
       status = input('Input position status (E or M): ', 's');            
    
    end
    
h = input('Input the number of hours worked this week: ');           % Input checkpoint (loop) for appropriate hour responses

    while (h < 0 || h > 168)
    
        disp('Invalid input error.');
        h = input('Hours worked this week: ');
    
    end
    
        if (status == "E" && h <= 40)                                % Four output possibilites for all employee statuses and hour brackets
        
        salary = 12 * h;
                    
        elseif (status == "E" && h > 40)
        
        salary = 480 + 17 * (h - 40);
            
        elseif (status == "M" && h <= 40)
        
        salary = 20 * h;
            
        elseif (status == "M" && h > 40)
        
        salary = 800 + 30 * (h - 40);
            
        end
    
    disp(salary);                                                    % Salary output
        
                