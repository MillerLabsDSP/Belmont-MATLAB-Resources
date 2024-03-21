% Zachary Miller
% Intro to MATLAB: Final Exam (Part 2)

% User input, image dimensions

disp('Input the image dimensions.');
width = input('Width (w): ');
height = input('Height (h): ');
angle = input('Angle of rotation: ');

% Original picture (C) rectangular coordinates

[C1x,C4x] = deal(width);
[C2x,C3x] = deal((-1) * width);
[C1y,C2y] = deal(height);
[C3y,C4y] = deal((-1) * height);

% Plot original picture (C)

plot(C1x,C1y,'k*','DisplayName','C1');
hold on;
plot(C2x,C2y,'k*','DisplayName','C2');
hold on;
plot(C3x,C3y,'k*','DisplayName','C3');
hold on;
plot(C4x,C4y,'k*','DisplayName','C4');
hold on;

% Assign/store coordinate pairs, compute to polar coordinates

x = C1x;
y = C1y;

[M,theta] = rect2polar(x,y);
    C1polM = M;
    C1poltheta = theta;

x = C2x;
y = C2y;

[M,theta] = rect2polar(x,y); 
    C2polM = M;
    C2poltheta = theta;

x = C3x;
y = C3y;

[M,theta] = rect2polar(x,y); 
    C3polM = M;
    C3poltheta = theta;

x = C4x;
y = C4y;

[M,theta] = rect2polar(x,y); 
    C4polM = M;
    C4poltheta = theta;

% Adjust angle by rotation (quadrant dependent)

adjustC1poltheta = deg2rad(C1poltheta + angle);
adjustC2poltheta = deg2rad(C2poltheta + (angle + 180));
adjustC3poltheta = deg2rad(C3poltheta + (angle + 180));
adjustC4poltheta = deg2rad(C4poltheta + angle);

% Plot new picture

[x,y] = polar2rect(C1polM,adjustC1poltheta);
    D1x = x;
    D1y = y;
    plot(D1x,D1y,'bo','DisplayName','D1');
    hold on;
[x,y] = polar2rect(C2polM,adjustC2poltheta);
    D2x = x;
    D2y = y;
    plot(D2x,D2y,'bo','DisplayName','D2');
    hold on;
[x,y] = polar2rect(C3polM,adjustC3poltheta);
    D3x = x;
    D3y = y;
    plot(D3x,D3y,'bo','DisplayName','D3');
    hold on;
[x,y] = polar2rect(C4polM,adjustC4poltheta);
    D4x = x;
    D4y = y;
    plot(D4x,D4y,'bo','DisplayName','D4');
    hold on;

% Assign plot characteristics

% axis([-10 10 -10 10])
legend
grid on
