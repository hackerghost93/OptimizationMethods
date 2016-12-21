function [ Xnew ,dx ,n ]= gradientDescent(objfnc ,StartP)
syms x y;
maxiter = 1000;
XSteps=zeros(maxiter , 1);
Error = 1e-6;
%lamda = 0.2 ;  for fixed step  
dx = inf; 
n=0; 
x0 = StartP ;
grad = gradient(objfnc,[x,y]);

while and(dx >= Error , n <= maxiter)  
    f = round (subs(grad,{x,y},x0));
   lambda = getLambda(objfnc,x0 , -f);
    Xnew = x0 - (lambda.*f); 
    
    if ~isfinite(Xnew)
        error('x is inf or NaN')
    end
    
    dx =  norm( round (Xnew - x0'));
    x0 = Xnew' ;
    
    n= n+1;
    %XSteps(n)= Xnew ;
    plot( )
end