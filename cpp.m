function [ cpp ] = cpp( T )
% Calculates the coal specific heat capacity

% cpp [j/kg/K]

global R;

if (T>=300 && T<=1000)
cpp = 100 * R * ...
    (-0.6705661 + 0.07181499e-1 * T - 0.05632921e-4*T^2 + ...
       0.02142298e-7*T^3 - 0.04168562e-11 * T^4);
elseif (T>1000 && T<=3000)
    cpp = 100 * R * ...
    (1.49016640 + 0.16621256e-2 * T - 0.06687201e-5*T^2 + ...
       0.12908796e-9*T^3 - 0.09205334e-13 * T^4);
   
else
    cpp=0;
end

end

