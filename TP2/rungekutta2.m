function [T U V]= rungekutta2(F,a,b,u0,h)
 
  M=(b-a)/h;  
  
  T=zeros(M+1,1);
  U=zeros(M+1,1);
  V=zeros(M+1,1);
  
  T=a:h:b;
  
  
  U(1) = u0(1);
  V(1) = u0(2);  
  
  T=a:h:b;
  
  for j=1:M
    q11 = h* (feval(F, T(j), U(j), V(j))(1));
    q12 = h* (feval(F, T(j), U(j), V(j))(2));
    q21 = h* (feval(F, T(j), U(j)+q11, V(j)+q12)(1));
    q22 = h* (feval(F, T(j), U(j)+q11, V(j)+q12)(2));
    
    
    U(j+1)= U(j)+ (q11 + q21)/2.0;
    V(j+1)= V(j)+ (q21 + q22)/2.0;
  end

