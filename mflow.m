function [ mflow_res ] = mflow ( d, T)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

global R v1  Tact densAir D YO2inf YO2;

Pabs = 101325; 

MWair = 0.03; % [kg/mol]

k = 1.9086e+03 * exp(-Tact/T); % rate coefficient

densAir = Pabs * MWair / (R * T);

D = (T/393).^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;

rDiff = v1/(densAir*D*2*pi*d);

rKin = v1 * R * T * (pi * d^2 * MWair * k* Pabs) .^-1;

mflow_res = YO2inf ./ (rDiff + rKin);

YO2 = mflow_res * rKin;

delta = (v1 + YO2) ./ v1;

% i=0;
% while abs(delta-1)>0.01
%     
%     delta
%     rDiff = delta * rDiff;
%     
% end


end



