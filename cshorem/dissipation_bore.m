% Bore dissipation model
% Diss has units [rho L^3/T^3]; 
% T = wave period
% Q = fraction of broken waves
% Hm is maximum stable wave height
%function [Diss] = dissipation_bore (T,Q,Hm)
function [Diss] = dissipation_bore (T,Q,Hm)

Diss = .25*9810*Q.*Hm.^2./T;


