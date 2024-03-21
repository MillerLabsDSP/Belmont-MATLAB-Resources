% Final Exam Study Guide Q4_1

function [thetaRad,thetaDeg,quadrant] = findAngle(x,y)
    thetaRad = atan(y/x);
    thetaDeg = rad2deg(thetaRad);

    if x > 0 && y > 0
        quadrant = 1;
    elseif x < 0 && y > 0
        quadrant = 2;
        thetaDeg = thetaDeg + 180;
    elseif x < 0 && y < 0
        quadrant = 3;
        thetaRad = thetaRad * -1;
        thetaDeg = 180+ (thetaDeg * -1);
    elseif x > 0 && y < 0
        quadrant = 4;
        thetaRad = thetaRad * -1;
        thetaDeg = thetaDeg * -1;
    end

    fprintf('Radians: %g\n', thetaRad);
    fprintf('Degrees: %g\n', thetaDeg);

end