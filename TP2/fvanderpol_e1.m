 function [vdp] = fvanderpol_e1 (t, u, v)   
   vdp(1) = v;
   vdp(2) = (1 - u^2) * v - u;
endfunction