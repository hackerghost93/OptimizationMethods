function [ result ] = UniVariant(func, start_point, maxi)
    syms x y
    result = start_point;
    checkStep = 0;
    probing_length = 0.01;
    while(StopCondition(func,result) == 0)
        % determine which axis to move
        if(checkStep == 0)
            S = [1,0];
        else
            S = [0,1];
        end
        % probe
        S = Probe(func,2,result,S,probing_length,maxi)
        % get perfect lamda
        lamda = getLamda(func, result, S)
        if(length(lamda) == 1)
            f_result = subs(func, [x,y], result + lamda.*S)
        else
            lamda
        end
        result = result + lamda.*S
        checkStep = mod(checkStep + 1,2);
        input('next iteration?');
    end
end
