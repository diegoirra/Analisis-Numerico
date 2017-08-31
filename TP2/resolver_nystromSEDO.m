function [T U V]=resolver_nystromSEDO(a,b,u0,h)
 
 
  %este metodo se usa solo con epilon= 1 
   F = 'fvanderpol_e1';
   
   [T, U, V] = nystrom(F, 0,30, [1,0], 0.1);
   plot(U, V);

 endfunction