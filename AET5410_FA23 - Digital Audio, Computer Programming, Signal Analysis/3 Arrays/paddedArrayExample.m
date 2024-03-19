% Manual array padding

clear
clc

a = randperm(10).';
b = randperm(randi(10)).';

lenA = length(a);
lenB = length(b);
paddedArray = zeros(lenA,1);


for n=1:lenA
    if (n > lenB)
        paddedArray(n,1) = 0;
    else
        paddedArray(n,1) = b(n,1);
    end
end

sigSum = cat(2,a,paddedArray);
disp(sigSum);

% Idea #1
%
% lenB = length(b);
% lenA = length(a);
% 
% % numZeros = lenA - lenB;
% zeroArray = zeros(numZeros,1);
% sigSum = a + cat(1,b,zeroArray);

% Idea #2
%
% sig1 = [a b].'; 
% sig2 = c.';
% sigSum = [sig1 sig2];
% disp(sigSum);