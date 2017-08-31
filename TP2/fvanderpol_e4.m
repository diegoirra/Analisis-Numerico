 function [vyd] = fvanderpol_e4 (t, u, v)   
   vyd(1) = v;
   vyd(2) = 4.0*(1 - u^2) * v - u;
endfunction