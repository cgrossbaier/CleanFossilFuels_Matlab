function [dmdt_result] = dmdt(T,V,r)


global Vstar 

if V <= Vstar
    dmdt_result = - mc(T,r) - dVdt(T,V);  
else
     dmdt_result = - mc(T,r);    
end

end
