% Calculate the forward difference of a vector or matrix
% The forward difference for 2 dimensional arrays are computed between 
% columns i.e. detadx(:,1) = (eta(:,2)-eta(:,1))/(dx)
% [detadx] = fdiff(dx,eta,order)
%
function [detadx] = fdiff (dx,eta,order)

if ~exist('order')
  order = 1;
end

if order>2
  error('Order can not be greater than 2')
end

if order==1
  detadxmid = (-eta(:,1:end-1)+eta(:,2:end))/(dx);
  detadxend = 0*eta(:,1);
  detadx=[detadxmid detadxend];
end
if order==2
  detadxmid = (-3*eta(:,1:end-2)+4*eta(:,2:end-1)-eta(:,3:end))/(2*dx);
  detadxend = 0*eta(:,1:2);
  detadx=[detadxmid detadxend];
end
