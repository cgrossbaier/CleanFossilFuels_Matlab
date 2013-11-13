clear all

% Main

% Constants

global R deltah deltahpyr Tact B1 Bv epsilon boltzmann;

R = 8.3144621; % Gas constants

deltah = 32e6; % Heat value [j/kg]

deltahpyr = 42e4; % Heat needed for combustion [j/kg]

Tact=8860; % Tact [K]

Bv= 37e4; % Bv

epsilon = 0.8; % emissivity of coal particle

boltzmann = 1.3806488e-23; % boltzmann constant [m2*kg /s^2 / K]

% Define Coal Particle

% Bituminous
wAsh= 0.101;
wVolatile = 0.367;
wCarbon = 0.532;

global w;
w=[wAsh,wVolatile,wCarbon]';

% Parameters

global d dens m mShare Vstar v1 b1 Tair Twall;

d = 1e-4; % Diameter [m]

dens = 1346; % Density [kg / m^]

m = dens * (pi*d^3/6); % Initial mass [kg]

mShare = m*w;% mshare [kg]

Vstar = mShare(2,1); % Vstar 

V=0; % V initial [kg]

T=300; % T initial [K]

v1= 31.99/12.01; % stochiometry

B1 = 450; % B1 [m/s]

Tair = 1000; % T air or infinity [K]

Twall = 300; % T wall or surrounding [K]


