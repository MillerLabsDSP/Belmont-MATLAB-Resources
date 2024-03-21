clear all
clc

yearInput = input('Input your current school year: ');

switch yearInput
    case 1
        class = "Freshman";
    case 2
        class = "Sophomore";
    case 3
        class = "Junior";
    case 4
        class = "Senior";  
    otherwise
        disp('error');
end

disp(class);
