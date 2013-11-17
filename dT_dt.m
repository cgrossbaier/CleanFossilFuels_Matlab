function [ dT_dt_res ] = dT_dt( m, d, T, V)
%dT_dt 
% Calculates the change of temperature with respect to time

% Global variables

global R deltah deltahpyr Tair epsilon boltzmann Twall Vstar

% DUMMY

mflow = 7.0476e-10;

% Energy released

dT_dt_res = mflow * deltah;

% Energy for devolatilisation

dT_dt_res = dT_dt_res - dV_dt(T, V)*deltahpyr;

% Energy from Convection

h = 2 * 0.064 / d; % Convective Heat Transfer coefficient
dT_dt_res = dT_dt_res - h * pi * d^2 * (T-Tair);

% Energy from radiation

dT_dt_res = dT_dt_res - epsilon * boltzmann * pi * d^2 * (T^4 - Twall^4);

% Times 1/(cpp * m)

dT_dt_res= dT_dt_res * (cpp(T)*m) ^(-1)

% Energy loss

dT_dt_res = dT_dt_res - T / m * dm_dt(T,V);

end

