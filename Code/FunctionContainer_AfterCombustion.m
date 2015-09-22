function dy = FunctionContainer_AfterCombustion(t,y)

dy = zeros(1,1);    % a column vector

T = y(1);
   
dy(1)= dT_dt_AfterCombustion(T);

%m, d, T, V, 0, 0



end

