clear vars

length = input('Input length: ');
width = input('Input width: ');
depth = input('Input depth: ');

board_ft = ((length * width * depth)/144);
fprintf('Bd. ft. = %2.3g\n', board_ft)