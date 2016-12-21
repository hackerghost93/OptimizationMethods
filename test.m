syms objFunc x y m;
objFunc = x^2 + y^2 ;
startP = [0,0];
[ Xnew,dx ,n ] = gradientDescent(objFunc ,startP)
    


%     diff(objFunc)
%[Xnew , dx , n , Xsteps ] = gradientDescent(objFunc , startP)
%optimal = newton(objFunc,startP)