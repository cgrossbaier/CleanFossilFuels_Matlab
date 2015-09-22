function [ dT_dt_res ] = dT_dt_AfterCombustion(T)
%dT_dt 
% Calculates the change of temperature with respect to time

% Global variables

global R deltah Tair epsilon boltzmann Twall Vstar mash dash

% Energy from Convection

h = 2 * 0.064 / dash; % Convective Heat Transfer coefficient
dT_dt_res = - h * pi * dash^2 * (T-Tair);

% Energy from radiation

dT_dt_res = dT_dt_res - epsilon * boltzmann * pi * dash^2 * (T^4 - Twall^4);

% Times 1/(cpp * m)

dT_dt_res= dT_dt_res * (1380*mash) ^(-1);
%dT_dt_res= dT_dt_res * (cpp(T)*m) ^(-1);

end

