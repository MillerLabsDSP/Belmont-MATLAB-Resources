gradeTotal=0;
nGrade=0;
    
while(nGrade<11)
    grade=input('Input grade: ');
    if(grade>-1 && grade<101)
        gradeTotal=gradeTotal+grade;
        nGrade=nGrade+1;
        if(nGrade==10)
            break;
        else
            continue;
        end
    end
end

gradeAverage = gradeTotal/10;
disp(gradeAverage);