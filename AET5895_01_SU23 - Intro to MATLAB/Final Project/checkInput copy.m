function checkInput(~)

pos = input('Input a position number (1-9): ','s');

while pos ~= '1' || pos ~= '2' || pos ~= '3' || pos ~= '4' || pos ~= '5' || pos ~= '6' || pos ~= '7' || pos ~= '8' || pos ~= '9'
     pos = input('Invalid input: Select a position number (1-9): ','s');
end