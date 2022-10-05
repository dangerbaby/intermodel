function [newzb]=morpho(in,sed,zb);
if in.iprofl ==0|length(in.timebc_wave)==1;
  newzb=zb;return;
end
%disp('in morpho')
islope = 0;
qx  =sed.aveqx;qx(isnan(qx))=0;

s  = islope*(zb(2:end)-zb(1:end-1))/in.dx;
Gspos = 1 - s./(in.tanphi-abs(s)); % for pos qx
Gsneg = 1 + s./(in.tanphi-abs(s));

qwallspos = [qx(1) qx].*[Gspos(1) Gspos Gspos(end)];ipos=(qwallspos>=0);
qwallsneg = [qx qx(end)].*[Gsneg(1) Gsneg Gsneg(end)];ineg=(qwallsneg<0);
qwalls=(qwallspos.*ipos+qwallsneg.*ineg);
%qwalls = window(qwalls,5);
%qwalls(2)= qwalls(1);
dqdx=(qwalls(2:end)-qwalls(1:end-1))/in.dx;
%dqdx = window(dqdx,5);
dt  = (in.timebc_wave(2)-in.timebc_wave(1));
newzb = zb-dt/(1-in.sporo)*dqdx;
