function drawboard(boardSpace)
% Board spaces (characters)
    disp(' ');
    disp('   === TIC-TAC-TOE ==='); disp('   ');            
    disp(' User (X) --- Computer (O)'); disp('   ');
    disp('         |   |   ');
    fprintf('       %c | %c | %c \n', boardSpace(1,1), boardSpace(1,2), boardSpace(1,3));
    disp('      ___|___|___');
    disp('         |   |   ');
    fprintf('       %c | %c | %c \n', boardSpace(2,1), boardSpace(2,2), boardSpace(2,3));
    disp('      ___|___|___');
    disp('         |   |   ');
    fprintf('       %c | %c | %c \n', boardSpace(3,1), boardSpace(3,2), boardSpace(3,3));
    disp('         |   |   '); disp('   ');
end