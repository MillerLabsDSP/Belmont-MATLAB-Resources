% Zachary Miller
% HW1, Q1

status = input('Input position status (E or M): ', 's');            % Entry point for position status

if(status == "E" || status == "M")

    h = input('Input the number of hours worked this week: ');      % Entry point for hours worked

        if (h >= 0 && h <= 168)

            if (status == "E" && h <= 40)                           % Four possible solutions within valid parameters
    
                salary = 12 * h;
            
            elseif (status == "E" && h > 40)

                salary = 480 + 17 * (h - 40);
    
            elseif (status == "M" && h <= 40)

                salary = 20 * h;
    
            elseif (status == "M" && h > 40)

                salary = 800 + 30 * (h - 40);
    
            end

            disp(salary);

        else

            disp('error: Hours input invalid')                      % Error for hours outside valid parameters
        
        end

else

    disp('error: Position entry not valid')                         % Error for position status that are not within case-sensitive parameters

end

