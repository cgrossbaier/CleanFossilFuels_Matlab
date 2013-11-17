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
[T,output] = ode45(@FunctionContainer,[0 0.05],[m, d, T, V, 0, 0]);

close all

% Label the points with the corresponding Circle number
C = cell(6, 1);
C{1,1}='Mass';
C{2,1}='Diameter';
C{3,1}='Temperature';
C{4,1}='Mass Volatiles';
C{5,1}='MFlow Change';
C{6,1}='Energy';


for i=1:6
   figure(i)
   
   hold on
   
    %ylim([0 max(output(:,i))]);
    
    xlabel('Time','FontSize',15 );
    ylabel(C{i,1},'FontSize',15 );
    
    plot(T, output(:,i))

     hold off

end

% 
% plot(T, output(:,2))
% plot(T, output(:,3))
% plot(T, output(:,4))
% plot(T, output(:,5))
% plot(T, output(:,6))
