function lambda = getLambda(objFunc,X,S)
    syms l;
    Point = X + (l.*S);
    Func = subs(objFunc,{x;y},Point);
    l = solve(diff(Func)==0);
    lambda=l;
end
