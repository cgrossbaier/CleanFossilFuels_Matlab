function [ mflow_res ] = mflow ( d, T)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% BOOK Version------------------------------
% global R v1  Tact densAir D YO2inf YO2;
% 
% Pabs = 101325; 
% 
% MWair = 0.03; % [kg/mol]
% 
% k = 1.9086e+03 * exp(-Tact/T); % rate coefficient
% 
% densAir = Pabs * MWair / (R * T);
% 
% D = (T/393).^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;
% 
% rDiff = v1/(densAir*D*2*pi*d);
% 
% rKin = v1 * R * T * (pi * d^2 * MWair * k* Pabs) .^-1;
% 
% mflow_res = YO2inf ./ (rDiff + rKin);
% 
% YO2 = mflow_res * rKin;
% 
% delta = (v1 + YO2) ./ v1;
% 
% % i=0;
% % while abs(delta-1)>0.01
% %     
% %     delta
% %     rDiff = delta * rDiff;
% %     
% % end
% BOOK Version------------------------------

global R v1 B1 Tact dens D YO2inf Sh densAir nu YO2;
 
% function [ result ] = mflowFast ( v, d, T, YO2)
% Pabs = 101325; 
%  
% densAir = 101325 * 0.03 ./ (R * T);
% MWair = 0.03; % [kg/mol]
%  
% result = v1 * pi * d^2 * densAir * YO2 * B1 ^(-Tact/T);
%            
% end
% 
%  
% function [ result ] = mflowSlow ( v, d, T, YO2)
%     
%     D = (T/393).^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;
%     result = 2 * pi * d * densAir * D * ln((1+YO2inf)/(1+YO2));
%     
% end


Pabs = 101325; 
densAir = 101325 * 0.03 ./ (R * T);
MWair = 0.03; % [kg/mol]
D = (T/393)^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;

%% 1 Try
% syms YO2 
% YO2=solve(...
% v1 * pi * d^2 * densAir * YO2 * B1 * exp(-7980/T)==...
% 2 * pi * d * densAir * D * log((1+YO2inf/v1)/(1+YO2/v1)));

% 2nd Try
% syms YO2 
% YO2=solve(...
% v1 * d * YO2 * B1 * exp(-7980/T)==...
% 1/v1*Sh*D*(YO2inf-YO2));

%% 3rd Try
%YO2 = (Sh * D * YO2inf) / (Sh*D+d * v1^2*B1*exp(-1*(7980^2)/T));


%% 4th try
%%YO2=D*YO2inf*(nu^2*d/2*B1*exp(-7980/T)+D)^(-1);

%% 5th try

%YO2 = (Sh*D/(d*v1^2*B1*exp(-7980/T))+1)^(-1)*YO2inf;


%% 6th try

YO2 = ((v1^2*d*B1*exp(-7980/T))/(Sh*D)+1)^(-1)*YO2inf;


%% Calculate mflow
%mflow_res = nu * pi * (d/4)^2 * densAir * YO2 * B1 * exp(-7980/T);

%mflow_res = v1 * pi * (d)^2 * densAir * YO2 * B1 * exp(-7980/T);
mflow_res=1/v1*Sh*pi*d*densAir*D*(YO2inf-YO2);
        
end



