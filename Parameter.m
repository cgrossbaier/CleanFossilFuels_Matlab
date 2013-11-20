function [time,output ] = Parameter( Twall_in, Tair_in, d_in, T_in )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global d V T Tair Twall

%% Main Parameters
d = d_in; % Diameter [m]

V=0; % V initial [kg]

T=T_in; % T initial [K]

Tair = Tair_in; % T air or infinity [K]

Twall = Twall_in; % T wall or surrounding [K]

Main

timeMax=0.45;
        
options = odeset('Events',@eventsCFF);

[time,output,te,ye,ie]=ode45(...
@FunctionContainer,...
[0 timeMax],...
[m, d, T, V, 0,0], ...
options);

end

