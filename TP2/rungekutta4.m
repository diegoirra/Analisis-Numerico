function [T U V]= rungekutta4(F,a,b,u0,h)
 
  M=(b-a)/h;  
  
  T=zeros(M+1,1);
  U=zeros(M+1,1);
  V=zeros(M+1,1);
  
  T=a:h:b;
  
  
  U(1) = u0(1);
  V(1) = u0(2);  
  
  T=a:h:b;
  
  for j=1:M
  
    k1 = h* (feval(F, T(j), U(j), V(j))(1));
    q1 = h* (feval(F, T(j), U(j), V(j))(2));    
    k2 = h* (feval(F, T(j)+ h/2, U(j)+ k1/2, V(j)+ q1/2)(1));
    q2 = h* (feval(F, T(j)+ h/2, U(j)+ k1/2, V(j)+ q1/2)(2));    
    k3 = h* (feval(F, T(j)+ h/2, U(j)+ k2/2, V(j)+ q2/2)(1));
    q3 = h* (feval(F, T(j)+ h/2, U(j)+ k2/2, V(j)+ q2/2)(2));    
    k4 = h* (feval(F, T(j)+ h, U(j)+ k3, V(j)+ q3)(1));
    q4 = h* (feval(F, T(j)+ h, U(j)+ k3, V(j)+ q3)(2));
    
    U(j+1)= U(j)+ (k1+2*k2+2*k3+k4)/6.0;
    V(j+1)= V(j)+ (q1+2*q2+2*q3+q4)/6.0;
  end