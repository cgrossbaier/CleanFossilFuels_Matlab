function [ dm_dt_res ] = dm_dt( T, V, d )
%dm_dt 
% Calculates the change of mass of the particle with respect to time

global Vstar dash

if V <= Vstar
    dm_dt_res = - mflow ( d, T) - dV_dt(T,V);
    
elseif d<= dash
    dm_dt_res = - mflow ( d, T);
    
else
    dm_dt_res=0;
end



end

