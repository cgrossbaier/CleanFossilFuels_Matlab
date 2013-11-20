function dy = MyFuncODE(t,y)

dy = zeros(5,1);    % a column vector

V = y(1);
r = y(2);
mc = y(3);
m = y(4);
T = y(5);

dy(1)= dVdt(T,V);
dy(2)= drdt(r,T,V);
dy(3)= dmcdt(T,r);
dy(4)= dmdt(T,V,r);
dy(5)= dTdt(m,r,T,V);
   
end

