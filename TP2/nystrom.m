function [T U V]=nystrom(F, a,b,u0,h)
  
  M=(b-a)/h;  
  
  T=zeros(M+1,1);
  U=zeros(M+1,1);
  V=zeros(M+1,1);
  
  T=a:h:b;
  
  
  U(1) = u0(1);
  V(1) = u0(2);  
  
  T=a:h:b;
  
  U(2)= u0(1) + h*u0(2) + h^2 /2 * ((1-U(1)^2)*V(1) - U(1));
  
  for j=2:M
    q11 = h* (feval(F, T(j), U(j), V(j))(1));
    q12 = h* (feval(F, T(j), U(j), V(j))(2));
    q21 = h* (feval(F, T(j), U(j)+q11, V(j)+q12)(1));
    q22 = h* (feval(F, T(j), U(j)+q11, V(j)+q12)(2));    
    
    prediccion_u = U(j)+ (q11 + q21)/2.0; %predictor: rk2
    
    %corrector: nystrom
    V(j)= (prediccion_u - U(j-1))/ (2.0 *h); 
    U(j+1)= 2*U(j) - U(j-1) + h^2*(feval(F, T(j), U(j), V(j))(2));
   
  end