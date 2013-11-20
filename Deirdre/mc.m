function [ mc_result ] = mc(T,r)


global rho Yo2_inf nu Bc Tactc P;
 
%df = (T/393)^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;
%Yo2s = (df*Yo2_inf)/((nu*r*(31.99/12.01)*Bc*exp(-Tactc/T))+(df));
%mc_result = 4*pi*(r^2)*(31.99/12.01)*rho*Yo2s*Bc*exp(-Tactc/T);

% For reaction: C + 1/2O2 --> CO
%MW_ab = 20;
%sigma_ab = ((3.385+3.690)/2);
D = (T/393).^1.5 * 1.6e-5;
YO2s=D*Yo2_inf*(nu^2*(r/4)*Bc*exp(-Tactc/T)+D)^(-1);
mc_result = nu * pi * (r/2)^2 * rho * YO2s * Bc * exp(-Tactc/T);
        
end


