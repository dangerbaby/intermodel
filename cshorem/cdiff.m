% Calculate the central difference of a vector or matrix
% The central difference for 2 dimensional arrays are computed between 
% columns i.e. detadx(:,2) = (eta(:,3)-eta(:,1))/(2*dx)
% [detadx] = cdiff(dx,eta,[order])
%
function [detadx] = cdiff (dx,eta,order)

if ~exist('order')
  order = 2;
end

if order==1|order==3|order>4
  error('Order can not = 1,3, or be greater than 4')
end

if order==2
  detadx1 = fdiff(dx,eta,2);
  detadxmid = (-eta(:,1:end-2)+ 0*eta(:,2:end-1) + eta(:,3:end))/(2*dx);
  detadxend = bdiff(dx,eta,2);
  detadx=[detadx1(:,1) detadxmid detadxend(:,end)];
end

if order==4
  detadx1 = fdiff(dx,eta,2);
  detadxmid = (eta(:,1:end-4)-8*eta(:,2:end-3)+0*eta(:,3:end-2)+8*eta(:,4:end-1)-1*eta(:,5:end))/(12*dx);
  detadxend = bdiff(dx,eta,2);
  detadx=[detadx1(:,1:2) detadxmid detadxend(:,end-1:end)];
end
