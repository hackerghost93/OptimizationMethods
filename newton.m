function optimalP = newton(objFunc,startP)
    syms x y;
    gradF = gradient(objFunc,[x,y]);
    f1 = subs(gradF,{x,y},startP);
    invJ = inv(jacobian(gradF,[x,y]));
    x2 = startP' - invJ *f1;
    f2 = subs(gradF,{x,y},x2');
    if f2<=0.0001
        optimalP = x2;
    else
        optimalP = 'indefined';
    end
end