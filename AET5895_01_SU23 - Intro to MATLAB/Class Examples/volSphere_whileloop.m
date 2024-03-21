r = input('Input the radius (r) of the sphere: ');

while(r < 0)

   disp('Error: can not compute');
   r = input('Input the radius (r) of the sphere: ');

end

vol = (4 * pi * r ^ 2) / 3 ;
    
disp([vol)

