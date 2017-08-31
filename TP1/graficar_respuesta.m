function graficar_respuesta(T,X)
  
  T2 = T;
  for fila = 2:10
    for columna = 2:10
      if T2(fila,columna) != 200;
        T2(fila,columna) = X(T2(fila,columna));
      end
    end      
  end
  
  
  display(T2);
  imagesc(T2);  
 endfunction