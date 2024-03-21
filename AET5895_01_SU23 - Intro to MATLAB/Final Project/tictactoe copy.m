% Game start
a=0; b=0;
repeat=1; repeat2=1;
boardSpace = ['1','2','3';'4','5','6';'7','8','9'];
drawboard(boardSpace);

% Turn #1 (user)

pos = checkInput_range;
boardSpace = checkInput_boardav(boardSpace,pos);
drawboard(boardSpace);

% Turn #1 (CPU)
while repeat > 0
CPUpos = randi(9,1);
pos = int2str(CPUpos);
[boardSpace,repeat] = checkInput_boardav_CPU(boardSpace,pos);
end
drawboard(boardSpace);
repeat = 1;

% Turn #2 (user)

while repeat2 > 0
pos = checkInput_range;
[boardSpace,repeat2] = checkInput_boardav(boardSpace,pos);
end
drawboard(boardSpace);
repeat2 = 1;

% Turn #2 (CPU)

while repeat > 0
CPUpos = randi(9,1);
pos = int2str(CPUpos);
[boardSpace,repeat] = checkInput_boardav_CPU(boardSpace,pos);
end
drawboard(boardSpace);
repeat = 1;

% Turn #3 (user)

while repeat2 > 0
pos = checkInput_range;
[boardSpace,repeat2] = checkInput_boardav(boardSpace,pos);
end
drawboard(boardSpace);
repeat2 = 1;
if a > b
    return;
end

% Turn #3 (CPU)

while repeat > 0
CPUpos = randi(9,1);
pos = int2str(CPUpos);
[boardSpace,repeat] = checkInput_boardav_CPU(boardSpace,pos);
end
drawboard(boardSpace);
repeat = 1;
[a,b]=winnerCheck(boardSpace);
if a > b
    return;
end

% Turn #4 (user)

while repeat2 > 0
pos = checkInput_range;
[boardSpace,repeat2] = checkInput_boardav(boardSpace,pos);
end
drawboard(boardSpace);
repeat2 = 1;
if a > b
    return;
end

% Turn #4 (CPU)

while repeat > 0
CPUpos = randi(9,1);
pos = int2str(CPUpos);
[boardSpace,repeat] = checkInput_boardav_CPU(boardSpace,pos);
end
drawboard(boardSpace);
repeat = 1;
[a,b]=winnerCheck(boardSpace);
if a > b
    return;
end

% Turn #5 (user)

while repeat2 > 0
pos = checkInput_range;
[boardSpace,repeat2] = checkInput_boardav(boardSpace,pos);
end
drawboard(boardSpace);
repeat2 = 1;
[a,b]=winnerCheck(boardSpace);
if a > b
    return;
else
    disp('Draw! No one wins...')
    return
end

