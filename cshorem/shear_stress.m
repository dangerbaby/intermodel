% function [tau_x tau_y] = shear_stress(cf,Hrms,h,alpha,T,U,V)
% cf           coeff of friction
%Hrms [meters] wave height
%h [meters]    water depth
%alpha [deg]  given angle rel. to x
%T [sec]       wave period
%U [m/s]       Current in x
%V [m/s]       Current in y ( can be column vec) 
% tau_x tau_y [kg/(m s^2)]
%note rho = 1000 is used herein
%
function [tau_x tau_y] = shear_stress(cf,Hrms,h,alpha,T,U,V)
V = V(:);
rho = 1000;
t = linspace(0,T,100);
w = 2*pi/T;
[k,n,c] = dispersion (w,h);
wave_vel = w*((Hrms./2)./sinh(k.*h))*sin(w*t);
u = U+wave_vel*cos(alpha*pi/180);
v = V+wave_vel*sin(alpha*pi/180);

abs_vel = sqrt(u.^2+v.^2);

tau_x = rho*cf*mean(abs_vel.*u,2);
tau_y = rho*cf*mean(abs_vel.*v,2);

  
  
