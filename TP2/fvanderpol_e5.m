 function [vyd] = fvanderpol_e5 (t, u, v)   
   vyd(1) = v;
   vyd(2) = 5.0*(1 - u^2) * v - u;
endfunction