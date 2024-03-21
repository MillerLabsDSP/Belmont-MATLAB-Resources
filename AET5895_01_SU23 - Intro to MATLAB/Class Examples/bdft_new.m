clear vars

length = input('Input length: ');
width = input('Input width: ');
depth = input('Input depth: ');

board_ft = board_feet(length,width,depth);
fprintf('Bd. ft. = %2.3g\n', board_ft);