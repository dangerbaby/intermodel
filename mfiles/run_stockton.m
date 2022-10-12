function [out] = run_stockton(g,in)
if g.istockton==0;out=[];return;end
addpath(['./stockton'])
L0 = 9.81*[in.Tp].^2/(2*pi);
beta_f = [in.beta_f];
out.r2p = [in.swlbc]+runup_stockton(beta_f,[in.Hrms]*sqrt(2),L0);




