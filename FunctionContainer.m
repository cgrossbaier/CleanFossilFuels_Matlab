function dy = FunctionContainer(t,y)

dy = zeros(6,1);    % a column vector
% dy(1) = y(2) * y(3);
% dy(2) = -y(1) * y(3);
% dy(3) = -0.51 * y(1) * y(2);

m = y(1);
d= y(2);
T = y(3);
V = y(4);

dy(1)= dm_dt(T, V, d);
dy(2)= dd3_dt(d,T);
dy(3)= dT_dt(m, d, T, V);
dy(4)= dV_dt(T,V);
dy(5)= dmflow_dt(d,T);
dy(6)= dE_dt(m, T);


%m, d, T, V, 0, 0



end

