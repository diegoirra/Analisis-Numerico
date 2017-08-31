function [ D,L,U ] = descomponer_matriz (A)
  
  [m,n]=size(A);
  
  for i=1:n
    D(i,i)=A(i,i);
  endfor
  
  for j=1:n-1
    for i=j+1:n
      L(i,j)=-A(i,j);
    endfor
  endfor
  
  L(n,n)=0;
  for i=1:n-1
    for j=i+1:n
      U(i,j)=-A(i,j);
    endfor
  endfor
  
  U(n,n)=0;
endfunction