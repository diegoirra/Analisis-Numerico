function [T U V]=euler(F,a,b,u0,h)
 
  M=(b-a)/h;  
  
  T=zeros(M+1,1);
  U=zeros(M+1,1);
  V=zeros(M+1,1);
  
  T=a:h:b;
  
  
  U(1) = u0(1);
  V(1) = u0(2);  
  
  T=a:h:b;
  
  for j=1:M
    U(j+1)= U(j)+ h* (feval(F, T(j),U(j),V(j))(1));
    V(j+1)= V(j)+ h* (feval(F, T(j),U(j),V(j))(2));    
  end

