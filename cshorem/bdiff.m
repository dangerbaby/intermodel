% Calculate the backward difference of a vector or matrix
% The backward difference for 2 dimensional arrays are computed between 
% columns i.e. detadx(:,2) = (eta(:,2)-eta(:,1))/(dx)
% [detadx] = bdiff(dx,eta,order)
%
function [detadx] = bdiff (dx,eta,order)

if ~exist('order')
  order = 1;
end

if order>2
  error('Order can not be greater than 2')
end

if order==1
  detadx1 = 0*eta(:,1);
  detadxmid = (eta(:,2:end)-eta(:,1:end-1))/(dx);
  detadx=[detadx1 detadxmid];
end

if order==2
  detadx1 = 0*eta(:,1:2);
  detadxmid = (1*eta(:,1:end-2)-4*eta(:,2:end-1)+3*eta(:,3:end))/(2*dx);
  detadx=[detadx1 detadxmid];
end
