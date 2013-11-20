clear all

% Main

% Constants

global R deltah deltahpyr TactVol Bv epsilon boltzmann YO2inf YO2;

R = 8.3144621; % Gas constants

deltah = 32e6; % Heat value [j/kg]

deltahpyr = 42e4; % Heat needed for combustion [j/kg]

TactVol=8860; % Tact [K]

Bv= 37e4; % Bv

epsilon = 0.8; % emissivity of coal particle

%boltzmann = 1.3806488e-23; % boltzmann constant [m2*kg /s^2 / K]

boltzmann = 5.67e-8; % boltzmann constant [m2*kg /s^2 / K]

YO2inf = 0.21 * 0.032 / (0.21 * 0.032 + 0.79 * 0.028); % Concentration of O2

% Define Coal Particle

% Bituminous
wAsh= 0.101;
wVolatile = 0.367;
wCarbon = 0.532;

global w;
w=[wAsh,wVolatile,wCarbon]';

% Parameters

global mflowInitial mash d dens m mShare Vstar v1 B1 Tair Twall Sh D densAir dash Vzero nu;

%% Main Parameters
d = 100e-6; % Diameter [m]

V=0; % V initial [kg]

T=300; % T initial [K]

Tair = 1000; % T air or infinity [K]

Twall = 300; % T wall or surrounding [K]

%% Other Parameters

dens = 1346; % Density [kg / m^3]

m = dens * (pi*d^3/6); % Initial mass [kg]

mShare = m*w;% mshare [kg]

Vstar = mShare(2,1); % Vstar 

mash = mShare(1,1);

dash = ((6*mash)/ (dens * pi))^(1/3);



YO2 = 0; % O2 Concentration

v1= 31.99/12.01; % stochiometry

B1 = 450; % B1 [m/s]



Sh = 2; % Sherwood number, 
% equal to 2 when velocity of particlae is similar 
% to Velocity of air

Pabs = 101325; 
densAir = 101325 * 0.03 ./ (R * T);
MWair = 0.03; % [kg/mol]
D = (T/393).^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;

nu=2;
mflowInitial=1/v1*Sh*pi*d*densAir*D*(YO2inf-YO2);





