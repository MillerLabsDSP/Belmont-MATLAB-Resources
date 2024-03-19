% condStatements.m

[x,Fs] = audioread('AcGtr.wav');
index = 100000;

left = x(1:index,1);
right = x(index+1:end,1);

lenLeft = length(left);
lenRight = length(right);

if (lenLeft > lenRight)
    numZeros = lenLeft - lenRight;
    right = [right; zeros(numZeros,1)];
else
    numZeros = lenRight - lenLeft;
    left = [left; zeros(numZeros,1)];
end

y = [left,right];
sound(y,Fs);