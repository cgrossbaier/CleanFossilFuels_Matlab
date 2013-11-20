% Test
clear all

global d V T Tair Twall Vstar

%% Main Parameters
d = 1.0000e-04; % Diameter [m]

V=0; % V initial [kg]

T=300; % T initial [K]

Tair = 1000; % T air or infinity [K]

Twall = 1800; % T wall or surrounding [K]

Main

global mflowInitial

timeMax=0.5;
           
options = odeset('Events',@eventsCFF);

[time,output,te,ye,ie]=ode45(...
@FunctionContainer,...
[0 timeMax],...
[m, d, T, V, mflowInitial,0], ...
options);

%% Correct for Volatiles

for i=1:size(output(:,4))
    
    if (abs((output(i,4)-Vstar)/Vstar)) <= 0.06
     output(i,4)=Vstar;
    end
end

%% Correct for Mflow

output(:,5)=-output(:,5);

time=time*1000; % t in ms

close all

% Label the points with the corresponding Circle number
C = cell(6, 1);
C{1,1}='Mass (kg)';
C{2,1}='Diameter';
C{3,1}='Temperature (K)';
C{4,1}='Mass Volatiles';
C{5,1}='MFlow Change';
C{6,1}='Energy';

% Correct diameter

%output(:,2) = (output(:,2)).^(1/3) ;

figure(2);

for i=1:(size(C)-1)
    
   subplot(2,3,i);
   
   plot(time, output(:,i))
      
    xlabel('Time [ms]','FontSize',15 );
    ylabel(C{i,1},'FontSize',15 );
    
    
     % Label for Mass
    
   if (i==1)
       
        %Mass of Ash
       line([0,timeMax*1000],[wAsh*m, wAsh*m]);
       text(10, wAsh*m*1.1, 'm_A');
       
       ylim([mash*0.8 m*1.1]);
       
   end
   
   % Label for diameter
   
   if (i==2)
       
       %Mass of particle - Mass of volatiles
       line([0,timeMax*1000],[dash, dash],'Color', 'black');
       text(10, dash*1.1, 'd_A');
       
       ylim([dash*0.8 d*1.1]);
   end
   
   % Label for Temperature
   
   if (i==3)
       
       % TWall
       line([0,timeMax*1000],[Twall, Twall],'Color', 'black');
       
       text(10, Twall+100, 'T_W');
       
       
       % TAir
       line([0,timeMax*1000],[Tair, Tair],'Color', 'black');
       text(10, Tair+100, 'T_A');
   end
   
   
    % Correct for Volatiles
    
   if (i==4)
       
       ylim([0 Vstar*1.1]);
       
       % Mass of Volatiles
       line([0,timeMax*1000],[Vstar, Vstar]);
       
   end
   
    % Correct for MFlow
    
   if (i==5)
       
   end

end



% Heat Transfer

%m, d, T, V, mflowInitial,0

[row, column]=size(output);
HeatTransferConvective=zeros(row,1);
HeatTransferReleased=zeros(row,1);
HeatTransferRadiation=zeros(row,1);
HeatTransferDevolitilisation=zeros(row,1);
HeatTransferLoss=zeros(row,1);

%% Convective

HeatTransferConvective= -2 * 0.064 .* pi .* output(:,2) .* (output(:,3)-Tair).* (1380*output(:,1)) .^(-1);

%% Energy released

HeatTransferReleased = output(:,5) .* deltah.* (1380*output(:,1)) .^(-1);

%% Energy from radiation

HeatTransferRadiation = -(epsilon * boltzmann * pi) .* output(:,2).^2 .* (output(:,3).^4 - Twall^4).* (1380*output(:,1)) .^(-1);


%% Energy from devolitilisation

for i=1:size(HeatTransferDevolitilisation)
    HeatTransferDevolitilisation(i)= -dV_dt(output(i,3), output(i,4));
end

HeatTransferDevolitilisation=HeatTransferDevolitilisation.*deltahpyr.* (1380*output(:,1)) .^(-1);
subplot(2,3,6);

%% Energy loss

for i=1:size(HeatTransferLoss)
    HeatTransferLoss(i)= -output(i,3) ./ output(i,1) * dm_dt(output(i,3),output(i,4),output(i,2));
end


%% Sum Energy Transfer

HeatTransferSum=HeatTransferConvective+HeatTransferReleased+HeatTransferRadiation+HeatTransferDevolitilisation+HeatTransferLoss;

HeatTransferPlot=plot(time,HeatTransferConvective,...
time,HeatTransferReleased,time,HeatTransferRadiation,...
time,HeatTransferDevolitilisation,...
time, HeatTransferLoss,...
time,HeatTransferSum);

xlabel('Time [ms]','FontSize',15 );
title('Heat transfer','FontSize',15 );
% Legend
PVleg = legend(HeatTransferPlot,'Convection', 'Released','Radiation','Devolitilisation', 'Energy loss','Sum');
set(PVleg,'Location','NorthEast')