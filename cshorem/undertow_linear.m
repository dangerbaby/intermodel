%function [U] = undertow_linear(h,Hrms,T)
% h [m] = mean water depth
% Hrms [m] = root-mean-square wave height
% T[s] = period
%U [m/s] is undertow computed with linear theory where waves propagate in positive x
function [U] = undertow_linear(h,Hrms,T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin<3;
  error('h,Hrms,T must be supplied as input')
end
g=9.81;
[k n c] = dispersion (2*pi./T,h);
U = -(g*Hrms.^2)./(8*c.*h);
