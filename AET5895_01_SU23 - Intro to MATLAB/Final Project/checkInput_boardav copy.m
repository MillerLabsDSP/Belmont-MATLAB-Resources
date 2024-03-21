function [boardSpace,repeat2] = checkInput_boardav(boardSpace,pos)
    while all([pos == '1',boardSpace(1,1) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '2',boardSpace(1,2) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '3',boardSpace(1,3) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '4',boardSpace(2,1) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '5',boardSpace(2,2) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '6',boardSpace(2,3) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '7',boardSpace(3,1) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '8',boardSpace(3,2) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '9',boardSpace(3,3) == 'X'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end

% ----------------------------------------------------------

    while all([pos == '1',boardSpace(1,1) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '2',boardSpace(1,2) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '3',boardSpace(1,3) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '4',boardSpace(2,1) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '5',boardSpace(2,2) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '6',boardSpace(2,3) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '7',boardSpace(3,1) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '8',boardSpace(3,2) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end
    while all([pos == '9',boardSpace(3,3) == 'O'])
        disp('Space already taken.')
        repeat2 = 1;
        pos = checkInput_range;
    end   

% ----------------------------------------------------------

    if all([pos == '1',boardSpace(1,1) == '1'])
        boardSpace(1,1) = 'X';
        repeat2 = 0;
    elseif all([pos == '2',boardSpace(1,2) == '2'])
        boardSpace(1,2)='X';
        repeat2 = 0;
    elseif all([pos == '3',boardSpace(1,3) == '3'])
        boardSpace(1,3)='X';
        repeat2 = 0;
    elseif all([pos == '4',boardSpace(2,1) == '4'])
        boardSpace(2,1)='X';
        repeat2 = 0;
    elseif all([pos == '5',boardSpace(2,2) == '5'])
        boardSpace(2,2)='X';
        repeat2 = 0;
    elseif all([pos == '6',boardSpace(2,3) == '6'])
        boardSpace(2,3)='X';  
        repeat2 = 0;
    elseif all([pos == '7',boardSpace(3,1) == '7'])
        boardSpace(3,1)='X';
        repeat2 = 0;
    elseif all([pos == '8',boardSpace(3,2) == '8'])
        boardSpace(3,2)='X';
        repeat2 = 0;
    elseif all([pos == '9',boardSpace(3,3) == '9'])
        boardSpace(3,3)='X';
        repeat2 = 0;
    end
end