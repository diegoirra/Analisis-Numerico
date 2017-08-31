function [matriz_datos,matriz_incognitas,b] = generar_matrices
  #crea la matriz de datos
  tamanio_matriz_datos = 11;
  matriz_datos = ones(tamanio_matriz_datos);


  #Cambia la primer fila por 100 y ultima por 0
  superior = linspace(100,100,tamanio_matriz_datos);
  inferior = linspace(0,0,tamanio_matriz_datos);


  matriz_datos(1:1,1:tamanio_matriz_datos) = superior;
  matriz_datos(tamanio_matriz_datos,1:tamanio_matriz_datos) = inferior;

  #Cambia los valores de los costados
  valor = 80;
  for fila = 2:10
      matriz_datos(fila,1) = valor ;
      matriz_datos(fila,11) = valor;
      if valor != 0
        valor = valor-20;
      end
  end

  #Cambia los valores conocidos del medio
  for columna = 4:8
    for fila = 4:8
      matriz_datos(fila,columna) = 200;
    end
  end

  #Completa los datos desconocidos
  numero_de_variable = 1;
  for fila = 2:10
    for columna = 2:10
      if matriz_datos(fila,columna) == 1
        matriz_datos(fila,columna) = numero_de_variable;
        numero_de_variable = numero_de_variable + 1;
      end
    end      
  end

  #crea la matriz de 56x56
  tamanio_matriz_incognitas = 56;
  diagonal = linspace(-4,-4,tamanio_matriz_incognitas);
  matriz_incognitas = diag(diagonal);

  #crea la matriz b
  cantidad_filas_b = 56;
  b = linspace(0,0,cantidad_filas_b);
  b = b';

  #Agrega los -1 en la matriz de 56x56 y agrega los datos a b
  for fila = 3:9
    valor1 = matriz_datos(fila,2);
    matriz_incognitas(valor1,matriz_datos(fila,3)) = 1;
    matriz_incognitas(valor1, matriz_datos(fila+1,2)) = 1;
    matriz_incognitas(valor1, matriz_datos(fila-1,2)) = 1;
    b(valor1) = -(matriz_datos(fila,1));
    valor2 = matriz_datos(fila, 10);
    matriz_incognitas(valor2,matriz_datos(fila,9)) = 1;
    matriz_incognitas(valor2, matriz_datos(fila-1,10)) = 1;
    matriz_incognitas(valor2,matriz_datos(fila+1,10)) = 1;
    b(valor2) = -(matriz_datos(fila,11));
  end

  for fila = 4:8
    valor1 = matriz_datos(fila,3);
    matriz_incognitas(valor1,matriz_datos(fila,2)) = 1;
    matriz_incognitas(valor1,matriz_datos(fila-1,3)) = 1;
    matriz_incognitas(valor1, matriz_datos(fila+1,3)) = 1;
    b(valor1) = -(matriz_datos(fila,4));
    valor2 = matriz_datos(fila,9);
    matriz_incognitas(valor2,matriz_datos(fila,10)) = 1;
    matriz_incognitas(valor2,matriz_datos(fila-1,9)) = 1;
    matriz_incognitas(valor2,matriz_datos(fila+1,9)) = 1;
    b(valor2) = -(matriz_datos(fila,8));
  end

  for columna = 3:9
    valor1 = matriz_datos(2,columna);
    matriz_incognitas(valor1,matriz_datos(2,columna-1)) = 1;
    matriz_incognitas(valor1,matriz_datos(2,columna+1)) = 1;
    matriz_incognitas(valor1,matriz_datos(3,columna)) = 1;
    b(valor1) = -(matriz_datos(1,columna));
    valor2 = matriz_datos(10,columna);
    matriz_incognitas(valor2,matriz_datos(10,columna-1)) = 1;
    matriz_incognitas(valor2,matriz_datos(10,columna+1)) = 1;
    matriz_incognitas(valor2,matriz_datos(9,columna)) = 1;
    b(valor2) = -(matriz_datos(11,columna));  
  end

  for columna = 4:8
    valor1 = matriz_datos(3,columna);
    matriz_incognitas(valor1,matriz_datos(3,columna-1)) = 1;
    matriz_incognitas(valor1,matriz_datos(3,columna+1)) = 1;
    matriz_incognitas(valor1,matriz_datos(2,columna)) = 1;
    b(valor1) = -(matriz_datos(4,columna));
    valor2 = matriz_datos(9,columna);
    matriz_incognitas(valor2,matriz_datos(9,columna-1)) = 1;
    matriz_incognitas(valor2,matriz_datos(9,columna+1)) = 1;
    matriz_incognitas(valor2,matriz_datos(10,columna)) = 1;
    b(valor2) = -(matriz_datos(8,columna));
  end

  valor1 = matriz_datos(2,2);
  matriz_incognitas(valor1,matriz_datos(2,3)) = 1;
  matriz_incognitas(valor1,matriz_datos(3,2)) = 1;
  b(valor1) = -(matriz_datos(2,1))-(matriz_datos(1,2));

  valor2 = matriz_datos(2,10);
  matriz_incognitas(valor2,matriz_datos(2,9)) = 1;
  matriz_incognitas(valor2,matriz_datos(3,10)) = 1;
  b(valor2) = -(matriz_datos(1,10))-(matriz_datos(2,11));

  valor3 = matriz_datos(10,2);
  matriz_incognitas(valor3,matriz_datos(10,3)) = 1;
  matriz_incognitas(valor3,matriz_datos(9,2)) = 1;
  b(valor3) = -(matriz_datos(10,1))-(matriz_datos(11,2));

  valor4 = matriz_datos(10,10);
  matriz_incognitas(valor4,matriz_datos(10,9)) = 1;
  matriz_incognitas(valor4,matriz_datos(9,10)) = 1;
  b(valor4) = -(matriz_datos(10,11))-(matriz_datos(11,10));

  valor5 = matriz_datos(3,3);
  matriz_incognitas(valor5,matriz_datos(2,3)) = 1;
  matriz_incognitas(valor5,matriz_datos(4,3)) = 1;
  matriz_incognitas(valor5,matriz_datos(3,2)) = 1;
  matriz_incognitas(valor5,matriz_datos(3,4)) = 1;

  valor6 = matriz_datos(3,9);
  matriz_incognitas(valor6,matriz_datos(2,9)) = 1;
  matriz_incognitas(valor6,matriz_datos(4,9)) = 1;
  matriz_incognitas(valor6,matriz_datos(3,10)) = 1;
  matriz_incognitas(valor6,matriz_datos(3,8)) = 1;

  valor7 = matriz_datos(9,3);
  matriz_incognitas(valor7,matriz_datos(10,3)) = 1;
  matriz_incognitas(valor7,matriz_datos(8,3)) = 1;
  matriz_incognitas(valor7,matriz_datos(9,2)) = 1;
  matriz_incognitas(valor7,matriz_datos(9,4)) = 1;

  valor8 = matriz_datos(9,9);
  matriz_incognitas(valor8,matriz_datos(10,9)) = 1;
  matriz_incognitas(valor8,matriz_datos(8,9)) = 1;
  matriz_incognitas(valor8,matriz_datos(9,10)) = 1;
  matriz_incognitas(valor8,matriz_datos(9,8)) = 1;

endfunction