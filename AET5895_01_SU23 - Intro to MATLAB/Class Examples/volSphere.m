r = input('Input the radius (r) of the sphere: ');

if(r < 0)

    vol = 'error';
    unit = 'error';
    disp('Error: can not compute');
    
    input('Input the radius (r) of the sphere: ');
    unit = input('Unit: ', 's');

else

    unit = input('Unit: ', 's');
    vol = (4 * pi * r ^ 2) / 3 ;
    
    disp(vol), disp('cubic'), disp(unit);

end




