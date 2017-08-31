
function resolver_gauss_directo()
  [T,A,b] = generar_matrices;
  printf('Metodo de Gauss con pivoteo parcial \n');
  Gauss = A\b;
  
  graficar_respuesta(T, Gauss);
endfunction