function [out] = run_stockdon(g,in)
if g.istockdon==0;out=[];return;end
addpath(['./stockdon'])
L0 = 9.81*[in.Tp].^2/(2*pi);
beta_f = [in.beta_f];
out.r2p = [in.swlbc]+runup_stockdon(beta_f,[in.Hrms]*sqrt(2),L0);




