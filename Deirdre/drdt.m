function drdt_result = drdt(r,T,V)

global rho_p Vstar

if V <= Vstar
drdt_result = (-mc(T,r)-dVdt(T,V))*(1/(4*pi*rho_p*(r^2)));
else
drdt_result = (-mc(T,r))*(1/(4*pi*rho_p*(r^2)));
end

return



