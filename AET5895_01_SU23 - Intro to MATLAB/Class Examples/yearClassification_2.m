clear all
clc

yearInput = input('Input your current school year: ');

    if(yearInput == 1)
        class = "Freshman";

    elseif(yearInput == 2)
        class = "Sophomore";

    elseif(yearInput == 3)
        class = "Junior";

    elseif(yearInput == 4)
        class = "Senior";

    else
        class = "error";
        
    end

disp(class);
