vec=randi(99,1,10);
disp(vec);

mean1=mean_zm(vec);     % My average function
disp(mean1);            

mean2=mean(vec);        % Native average function 
disp(mean2);

                                
std1=std_zm(vec);       % My standard deviation function
disp(std1);

std2=std(vec,1);        % Native standard deviation function
disp(std2);