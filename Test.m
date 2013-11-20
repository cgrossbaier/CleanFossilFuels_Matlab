% Test
clear all

global d V T Tair Twall

%% Main Parameters
d = 1.0000e-04; % Diameter [m]

V=0; % V initial [kg]

T=300; % T initial [K]

Tair = 1000; % T air or infinity [K]

Twall = 300; % T wall or surrounding [K]

Main

global mflowInitial

timeMax=0.5;
           
options = odeset('Events',@eventsCFF);

[time,output,te,ye,ie]=ode45(...
@FunctionContainer,...
[0 timeMax],...
[m, d, T, V, mflowInitial,0], ...
options);

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

for i=1:size(C)
    
   subplot(2,3,i);
   
   plot(time*1000, output(:,i))
      
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
       
       text(10, Twall+100, 'T_(Wall)');
       
       
       % TAir
       line([0,timeMax*1000],[Tair, Tair],'Color', 'black');
       text(10, Tair+100, 'T_(Air)');
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



%% Heat Transfer

