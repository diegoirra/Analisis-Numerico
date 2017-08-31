function [T_1, U_1, V_1] = resolver_eulerSEDO()

    [T_1 U_1 V_1]=euler('fvanderpol_e1', 0, 35, [1 0], 0.1);
    
    plot(U_1, V_1);   

  endfunction