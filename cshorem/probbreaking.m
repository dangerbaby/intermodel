% [Q] = probbreaking (Hrms,Hm)
function [Q] = probbreaking (Hrms,Hm)
oshape = size(Hrms);
Hrms = Hrms(:); Hrms= max(Hrms,0);
Hm = Hm(:);

r = Hrms.^2./Hm.^2;
r = min(r,1-2*eps);
dQ = 1e-3;
Qdum = 0:dQ:1-eps;
rdum = (Qdum-1)./log(Qdum);
Q = interp1(rdum,Qdum,r);
Q(Q<dQ)=0;
err=((Q-1)./log(Q) - Hrms.^2./Hm.^2);
Q=reshape(Q,oshape);

return







Q=.5*ones(size(Hm));
ind_fullbreak = (Hrms>=Hm);
Q(ind_fullbreak)=1;
ind_nobreak = (Hrms./Hm<.01);
Q(ind_nobreak)=0;
ind = ~ind_fullbreak&~ind_nobreak
err = zeros(size(Hm));err(ind) = 1;
count = 0;
while max(max(abs(err)))>10^-4;
  count = count+1;
  if count >100;disp(Hrms);error('Error: Stuck in the probbreaking call');end
  err(ind)=((Q(ind)-1)./log(Q(ind)) - Hrms(ind).^2./Hm(ind).^2);
  dQ =  ((Q-1)./log(Q) - Hrms.^2./Hm.^2)./(1./log(Q)-(Q-1)./(log(Q).^2.*Q));
  %Q(ind) = Q(ind)-.25*dQ(ind)
  Q(ind) = max(0,Q(ind)-.25*dQ(ind))
end

%disp(['local Q =',num2str(Q),' with Hrms/Hm = ',num2str(Hrms/Hm)]) 
