 function [vyd] = fvanderpol_e3 (t, u, v)   
   vyd(1) = v;
   vyd(2) = 3.0*(1 - u^2) * v - u;
endfunction