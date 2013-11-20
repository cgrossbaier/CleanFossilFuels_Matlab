function [dTdt_result] = dTdt(m,r,T,V)


global Nuss lambda e sigma cp_p h_coal h_pyr Tgas Tsurr;
 

mflow_value = mc(T,r);


% Energy released

dTdt_result = mflow_value * h_coal;

% Energy for devolatilisation

dTdt_result = dTdt_result - dVdt(T,V)*h_pyr;

% Energy from Convection

h = 2 * 0.064 / (2*r); % Convective Heat Transfer coefficient
dTdt_result = dTdt_result - h * pi * (2*r)^2 * (T-Tgas);

% Energy from radiation

dTdt_result = dTdt_result - e * sigma * pi * (2*r)^2 * (T^4 - Tsurr^4);

% Times 1/(cpp * m)

dTdt_result = dTdt_result * (cp_p*m)^(-1);

% Energy loss

dTdt_result = dTdt_result - (T / m )* dmdt(T,V,r);



end
