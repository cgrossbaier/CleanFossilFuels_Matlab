function [ dE_dt_res ] = dE_dt( m, T )
%dm_dt 
% Calculates the change of Energy of the 
% system with respect to time

% Assumption: Enthalpy h = Energy of system

dE_dt_res = m * cpp(T)*T;


end

