% [x0] = interp_brad (x,f)
% f = array with zero crossing
function [x0] = interp_brad (x,f)

dum = f(1:end-1).*f(2:end);[j1 j2]= find(dum<=0);
if isempty(j2);
  %  disp('No zero crossing in f')
  x0 = NaN;
  return
end
f2 = f(j2-2:j2+2);
x2 = x(j2-2:j2+2);
[f2,IA,IC] = unique(f2); 
x2 = x2(IA);
f3= f2(~isnan(f2));
x3= x2(~isnan(f2));
x0 = interp1(f3,x3,0);

