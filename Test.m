% Test
Main

% %
% mflow(d, T)
% 
% dmflow_dt( d,T )
% 
% %dd3_dt( d,T )
% 
% dE_dt( m, T )
% 
% dT_dt( m, d, T, V)

%FunctionContainer( m, d, T, V )


%[T,Y]= ode45(@FunctionContainer, [0,2], [t, m, d, T, V],options)

options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);

timeMax=0.081;

[time,output] = ode45(@FunctionContainer,[0 timeMax],[m, d, T, V, 0,0]);

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

output(:,2) = (output(:,2)).^(1/3) ;

for i=1:size(C)
   figure(i)
   
   hold on
   
    xlabel('Time [ms]','FontSize',15 );
    ylabel(C{i,1},'FontSize',15 );
    
    plot(time*1000, output(:,i))

    hold off

end







