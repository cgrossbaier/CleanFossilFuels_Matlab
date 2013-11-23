function [ dm_dt_res ] = dm_dt( T, V, d )
%dm_dt 
% Calculates the change of mass of the particle with respect to time

global Vstar dash mash

dm_dt_res = - mflow ( d, T) - dV_dt(T,V); 




end

