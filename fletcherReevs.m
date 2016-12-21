function optimalP = fletcherReevs(objFunc,startP)
    syms x y optimalP lambda;
    gradF = gradient(objFunc,[x,y]);
    
    f1 = subs(gradF,{x,y},startP);
    S1= -f1; 
    lambda = getLambda(objFunc,startP,S1);
    X2 = startP' + (lambda .* S1)
    f2 = subs(gradF,{x;y},X2)
    if f2 == 0
        optimalP = X2;
    else
        fold = f1; Sold = S1; fnew = f2; Xold = X2;
        for i=1:10000
            Snew = -fnew + ((norm(fnew))^2 / (norm(fold))^2) * Sold;
            lambda = getLambda(objFunc,Xold',Snew);
            Xnew = Xold + lambda * Snew
            fnew = subs(gradF,{x;y},Xnew)
            
            if fnew < 0.000000001 
                optimalP = Xnew;
                break;
            else
                fold = fnew; Sold = Snew; Xold = Xnew;
            end
        end
    end
    
end