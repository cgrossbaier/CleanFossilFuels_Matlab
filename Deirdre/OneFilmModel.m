clear all
close all
clc

% Particle Parameters
global r rho_p m mc ma mv 
r = 125*(10^-6);    %m
rho_p = 2000; %kg/m3
m = (4/3*pi*r^3)*rho_p; %

mc = 0.8*m; % carbon content
ma = 0.1*m; % ash content 
mv = 0.1*m; % volatile content


% Devolatilisation
global Bv Tactv Vstar
Bv = 37e4; %(J/kg)
Tactv = 8860; %[K]
Vstar = m*0.1; %(kg) 

% mc
global rho  Yo2_inf nu Bc Tactc P
Ts0 = 300;
R = 8.135;
P = 101325;
rho = P * 0.03 ./ (R * Ts0);
Yo2_inf = 0.233;
nu = 2.664;
Bc = 450/1000;       % C + 1/2O2 --> CO
Tactc = 7980;

%Ts
global Nuss lambda e sigma cp_p h_coal h_pyr Tgas Tsurr;
Nuss = 2;
lambda=.12;
sigma=5.6703e-8; %W/m2K4
e = 1;
cp_p=1380; 
h_coal=3.2765*(10^7); %J/kg
h_pyr= 420e3; %J/kg
Tgas=1500;
Tsurr = 500; %temp wall

V=0; % V initial [kg]
T=300; % T initial [K]
YO2 = 1; % O2 Concentration

%mflowInitial=2 * pi * d * densAir * D * log((1+YO2inf/v1)/(1+YO2/v1));

timeMax=3;

options = odeset('Events',@eventsCC);
            
[t,y]=ode15s(@MyFuncODE,[0 timeMax],[V, r, mc, m, T],options);

%close all

%plot(t,y(:,3))

% Label the points with the corresponding Circle number
C = cell(5, 1);
C{1,1}='Mass Volatiles(kg)';
C{2,1}='Radius (m)';
C{3,1}='Mass Carbon(kg)';
C{4,1}='Total Mass(kg)';
C{5,1}='Temperature (K)';

subplot(2,3,1);
plot(t*1000, y(:,1))
xlabel('Time [ms]','FontSize',15 );
ylabel(C{1,1},'FontSize',15 );

subplot(2,3,2);
plot(t*1000, y(:,2))
xlabel('Time [ms]','FontSize',15 );
ylabel(C{2,1},'FontSize',15 );

subplot(2,3,3);
plot(t*1000, y(:,3))
xlabel('Time [ms]','FontSize',15 );
ylabel(C{3,1},'FontSize',15 );

subplot(2,3,4);
plot(t*1000, y(:,4))
xlabel('Time [ms]','FontSize',15 );
ylabel(C{4,1},'FontSize',15 );

%Mass of particle - Mass of volatiles
line([0,3*1000],[ma+mc, ma+mc],'Color', 'black');
text(10, ma*1.1, 'm_A');
       

subplot(2,3,5);
plot(t*1000, y(:,5))
xlabel('Time [ms]','FontSize',15 );
ylabel(C{5,1},'FontSize',15 );

% for i=1:size(C)
%     
%    subplot(2,3,i);
%    
%    plot(t*1000, y(:,i))
%       
%     xlabel('Time [ms]','FontSize',15 );
%     ylabel(C{i,1},'FontSize',15 );
%     
%     
%      % Label for Mass
%     
%    if (i==1)
%        
%        % Mass of Ash
%        line([0,timeMax*1000],[wAsh*m, wAsh*m]);
%        text(10, wAsh*m*1.1, 'm_A');
%        
%    end
%    
%    % Label for diameter
%    
%    if (i==2)
%        
%        % Mass of particle - Mass of volatiles
%        line([0,timeMax*1000],[dash, dash],'Color', 'black');
%        text(10, dash*1.1, 'd_A');
%    end
%    
%    % Label for Temperature
%    
%    if (i==3)
%        
%        % TWall
%        line([0,timeMax*1000],[Twall, Twall],'Color', 'black');
%        
%        text(10, Twall+100, 'T_(Wall)');
%        
%        
%        % TAir
%        line([0,timeMax*1000],[Tair, Tair],'Color', 'black');
%        text(10, Tair+100, 'T_(Air)');
%    end
%    
%    
%     % Correct for Volatiles
%     
%    if (i==4)
%        
%        ylim([0 max(output(:,i))*1.1]);
%        
%        % Mass of Volatiles
%        line([0,timeMax*1000],[Vstar, Vstar]);
%        
%    end
% 
% end


