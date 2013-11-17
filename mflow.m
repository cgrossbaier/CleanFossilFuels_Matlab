function [ mflow_res ] = mflow ( v, d, T)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

global R v1 B1 Tact dens D YO2inf Sh YO2;

function [ result ] = mflowZero ( v, d, T, YO2)

densAir = 101325 * 0.03 ./ (R * T);

result = v1 * pi * d^2 * densAir * YO2 * B1 * exp(-Tact/T)...
    -1 / v1 * Sh * pi * d * dens * D * (YO2inf - YO2);

end


% 
% function [ mflow_res ] = mflowSlow ( v, d, T, YO2)
% 
% mflow_res = 1 / v1 * Sh * pi * d * dens * D * (YO2inf - YO2);
% 
% end

densAir = 101325 * 0.03 ./ (R * T);

%syms YO2

fsolve(@mflowZero(v, d, T, YO2), YO2);

%mflow_res=v1 * pi * d^2 * densAir * YO2 * B1 * exp(-Tact./T);

return

end



