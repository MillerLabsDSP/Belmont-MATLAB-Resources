function pos = checkInput_range
pos = input('Input a position number (1-9): ');
    while pos < 1 || pos > 9
         disp('Invalid input.');
         pos = input('Input a position number (1-9): ');
    end
    pos = num2str(pos);
end