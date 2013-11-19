function DD = dd_dt(d, T, V )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global dens

%DD3 = - 6 * (mflow ( d, T) + dV_dt(T, V))/ (pi*dens); 
   
DD = (-mflow(d,T)-dV_dt(T, V))*3/(pi*dens*d^2);

return



