function r2p = runup_stockdon(beta_f,Hmo,L0)
%  function r2p = runup_stockdon(beta_f,Hmo,L0)
% r2p = 2% runup based on Stockton 2006
% Hmo = energy-based significant wave height offshore
% r2p = 1.1*(.35*beta_f*sqrt(Hmo.*L0)+.5*sqrt(Hmo.*L0*(.563*beta_f.^2+.004)))
% Typically L0 = g*T^2/(2*pi)  
  r2p = 1.1*(.35*beta_f.*sqrt(Hmo.*L0)+.5*sqrt(Hmo.*L0.*(.563*beta_f.^2+.004)));
