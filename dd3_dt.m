function DD3 = dd3_dt(d,T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global dens

DD3 = - 6 * mflow ( d, T) / (pi*dens);

return



