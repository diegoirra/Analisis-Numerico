 function [vyd] = fvanderpol_e2 (t, u, v)   
   vyd(1) = v;
   vyd(2) = 2.0*(1 - u^2) * v - u;
endfunction