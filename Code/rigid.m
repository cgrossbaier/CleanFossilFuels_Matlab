function dy = FunctionContainer(t,y)

dy = zeros(6,1);    % a column vector
% dy(1) = y(2) * y(3);
% dy(2) = -y(1) * y(3);
% dy(3) = -0.51 * y(1) * y(2);

dy(1)= dm_dt(y(3), y(4), y(2));
dy(2)= dV_dt(y(3),y(4));
dy(3)= dT_dt(y(1), y(2), y(3), y(4));
dy(4)= dmflow_dt(y(2),y(3));
dy(5)= dE_dt(y(1), y(3));
dy(6)= dd3_dt(y(2),y(3));


end

