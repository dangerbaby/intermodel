%Calculate the changing angle due to refraction for the 
% case of straight parallel contours for monchromatic wave
% alpha0[deg]
% h0[m]
% T[s]
% d [m] matrix or array of depths from which to find angles
% alpha [deg] is matrix or array of angles with size(alpha)=size(d) 
% function [alpha] = snells(alpha0,h0,T,d)
function [alpha] = snells(alpha0,h0,T,d)
omega = 2*pi./T;
[k0] = dispersion (omega,h0);c0 = omega./k0;
[k] = dispersion (omega,d);c = omega./k;
alpha = real(180/pi*asin(sin(alpha0*pi/180).*c./c0));
