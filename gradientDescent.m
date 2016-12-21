function [Xnew ,dx ,n , XSteps]= gradientDescent(objfnc ,StartP)
syms x y;
maxiter = 1000;
XSteps=zeros(maxiter , 1);
Error = 1e-6;
lamda = 0.1 ; 
dx = inf; 
n=0; 
x0 = StartP ;
grad = gradient(objfnc,[x,y]);

while or(dx>=Error, n <= maxiter)  
    
    f=subs(grad,{x,y},StartP);
    Xnew = x0 - lamda*f ;
    
    if ~isfinite(Xnew)
    error('x is inf or NaN')
    end
    
    x0 = Xnew ;
    n= n+1 ;
    dx= abs(Xnew-x);
    %XSteps(n)= Xnew ;
end

 
 
