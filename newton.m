syms objFunc x y;
objFunc = x-y+2*x^2+2*x*y+y^2;
startP = [0,0];


gradF = gradient(objFunc,[x,y]);
%start iterations -> stopping condition ??

f1 = subs(gradF,{x,y},startP);
invJ = inv(jacobian(gradF,[x,y]));
x2 = startP' - invJ *f1;
f2 = subs(gradF,{x,y},x2');
if f2<=0.0001 
    optimalP = x2;
end
    