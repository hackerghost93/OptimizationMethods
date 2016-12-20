function [ value ] = Probe(func,variable_number, X, S, probing_length, maxi)
    valPos = X + S.*probing_length;
    valNeg = X - S.*probing_length;
    syms x y 
    valuePos = subs(func, [x,y], valPos);
    valueNeg = subs(func, [x,y], valNeg);
    if(maxi == 1)
        if(valuePos >= valueNeg)
            value = S;
        else
            value = -1.*S;
        end
    else
        if(valuePos <= valueNeg)
            value = S;
        else
            value = -1.*S;
        end
    end
    
end

