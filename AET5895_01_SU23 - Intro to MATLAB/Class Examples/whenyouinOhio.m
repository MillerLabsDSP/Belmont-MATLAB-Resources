stateStatus = disp('What state are you from?', 's')

if(s == "Ohio" || s == "ohio")

    stateStatus = 'Ohio';
    disp('Down in Ohio, swag like Ohio!')
    [y,Fs] = audioread('Lil B - Swag like Ohio.wav');

else 
    
    stateStatus = 'notOhio';
    disp('Reconsider your inhabitance.')

end