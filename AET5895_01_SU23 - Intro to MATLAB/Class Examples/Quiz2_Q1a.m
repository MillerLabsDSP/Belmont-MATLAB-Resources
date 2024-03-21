i=1;

while i<11
    vec(1,i)=input('Input a value: ');
    i=i+1;
end

average=sum(vec)/length(vec);
disp(average);