function selectChar(~)
charUser = input('Select your marker... Xs or Os?: ', 's');
if charUser ~= 'X' || charUser ~= 'O'
    disp('Error: Invalid character response.')
    charUser = input('Select your marker... Xs or Os?: ', 's');
end