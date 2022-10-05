%radstress computes the linear radiation stresses
% Hrms [m] = root-mean-square wave height
% alpha[deg] = wave angle with (+) alpha generating (+) Sxy
% n = ratio of group speed to phase speed
% c[m/s] = phase speed
% Sxy, Sxx, Syy are elements of rad-stress trensor
% Efx, Efy are energy fluxes in the x and y directions.
%function [Sxy Sxx Syy] = radstress (Hrms, alpha, n, c)
function [Sxy,Sxx,Syy, Efx, Efy] = radstress (Hrms, alpha, n, c)
allsz = [size(Hrms);size(alpha);size(n);size(c)];
maxsz = max(allsz);maxsz=[maxsz(1) maxsz(2)];
if max(size(Hrms))==1;Hrms=Hrms*ones(maxsz);end
if max(size(alpha))==1;alpha=alpha*ones(maxsz);end
if max(size(n))==1;n=n*ones(maxsz);end
if max(size(c))==1;c=c*ones(maxsz);end
if size(unique(allsz,'rows'),1)>1;error(['Hrms, alpha, n, c must have the same size or be scalars']);end
a = alpha*pi/180;
g = 9.81;
rho = 1000;
E=1/8*rho*g*Hrms.^2;
Sxy = E.*n.*cos(a).*sin(a);
Sxx = E.*(n.*(cos(a).^2+1)-.5);
Syy = E.*(n.*(sin(a).^2+1)-.5);
Efx = E.*n.*c.*cos(a);
Efy = E.*n.*c.*sin(a);
