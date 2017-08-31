function resolver_GS_con_gauss_directo()
  
  [M,A,b] = generar_matrices;
  Gauss = A\b;
  
  vector_ini = Gauss;
  tolerancia = 10^-3;
  % iter_max = 20 %iteracion maxima, 20?
  
  [D,L,U]= descomponer_matriz(A);  
  T=((D-L)^-1)*U;
  C=((D-L)^-1)*b;
  
  vector_actual = vector_ini;
  error=tolerancia+1;
  i = 0;
  
  % para usar iteracion maxima cambiar la condicion del while
  % y habilitar iter_max ahi arriba
  
  % while error>tolerancia & i < iter_max
  while error>tolerancia
    i = i+1;
    X=T*vector_actual+C;    
    error=norm(X-vector_actual, Inf);
    vector_actual=X;
  endwhile
  
  printf('Se hicieron %d iteraciones\n', i); %imprime el numero de iteraciones
  
  graficar_respuesta(M,X);
 endfunction