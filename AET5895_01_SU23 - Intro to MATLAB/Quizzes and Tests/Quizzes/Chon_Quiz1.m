% Zachary Miller

hoursInput = input('Please input your weekly hours worked: ');

if(hoursInput <= 40)                            % Salary process for employee WITH NO overtime (40 hours a week or less)
    workTime = "under";
    pay = hoursInput * 12;

elseif(hoursInput > 40)
    workTime = "over";
    pay = 480 + ((hoursInput - 40) * 17);       % Salary process for employee WITH overtime (more than 40 hours/week)

end

disp(pay);