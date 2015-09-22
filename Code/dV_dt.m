function [ dV_dT_res ] = dV_dt( T, V)
% dV_dT 
%
%
% V  :  total of volatiles evolved up to time t 
% Vstar [kg]:  the ultimate yield of volatiles at t = infinity
%       equal to the total volatile content of coal.
%       determined experimentally
% kv :  rate constant expressed as an Arrhenius relationship.
% Bv [1/s]:  
% Tact [K]:
% T [K]: 

% The implication is that V* is a function of temperature 
% and increases as the temperature increases. 
% With increasing temperature 
% stronger and stronger bonds are ruptured and hence 
% the apparent yield is more. As the peak temperature is 
% further increased, the yield approaches a constant 
% value around 1173 K for the lignite. This is referred to 
% as the apparent yield. The variation of the apparent 
% yield with temperature is one of the serious limitations 
% of the single reaction model.

% Global variables

global Bv TactVol Vstar

kv = Bv * exp(-TactVol/T);

dV_dT_res = kv * (Vstar-V);

end

