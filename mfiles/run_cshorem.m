function [out] = run_cshorem(g,in)
if g.icshorem==0;out=[];return;end
addpath(['./cshorem'])

for i = 1:length(in);in(i).A0=4.5;end


out=cshore(in);



