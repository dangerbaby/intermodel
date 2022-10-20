function R=makeRT(theta,P1)
%theta = counterclockwise rotation about the z axis in degrees
%P1 = [x y] of origin

rot=[cos(deg2rad(theta)) sin(deg2rad(theta)) 0;...
     -sin(deg2rad(theta)) cos(deg2rad(theta)) 0;...
     0 0 1];

translate = [1 0 -P1(1);...
            0 1 -P1(2);...
            0 0 1];
        
R = rot*translate;        

end