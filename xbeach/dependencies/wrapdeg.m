function alpha2 = wrapdeg(alpha)

% maps arbitrary angles in deg to space from -180 to 180
alpha2 = mod((alpha+180),360)-180;
