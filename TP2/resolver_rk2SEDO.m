function [T_1 U_1 V_1] = resolver_rk2SEDO()
  
   [T_1 U_1 V_1]= rungekutta2('fvanderpol_e1', 0, 35, [1 0], 0.1);
   
   plot(U_1, V_1);
   
  endfunction