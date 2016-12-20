syms objFunc x y;
objFunc = x-y+2*x^2+2*x*y+y^2;
startP = [0,0];
optimal = newton(objFunc,startP)