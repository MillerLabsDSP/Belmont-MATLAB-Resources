% Zachary Miller
% 7/10/23
% Midterm, Q1

i=12; profit=10;                                % Initialization of age and starting profit

while profit<1000                               % While loop to keep max profit at $1000
    age=i;              
    i=i+1;
    profit=profit*2;
    disp('Age:'); disp(age);                    % Age output
    disp('Profit ($):'); disp(profit/2);        % Profit output (div by 2 so the starting age isn't doubled!)
    disp('------');                             
end