function DD = dd_dt(d, T, V )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global dens Vstar

%DD3 = - 6 * (mflow ( d, T) + dV_dt(T, V))/ (pi*dens); 

%if V <= Vstar
    
DD = (-mflow(d,T)-dV_dt(T, V))*2/(pi*dens*d^2);

%else
%DD = (-mflow(d,T))*2/(pi*dens*d^2);  
%end


return



