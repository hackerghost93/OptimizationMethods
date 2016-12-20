function [ result ] = UniVariant(func, start_point, maxi)
    syms x y
    result = start_point;
    checkStep = 0;
    fresult_last = -1000;
    fresult = 1000;
    last_result = result + 1;
    probing_length = 0.01;
    while(StopByLast( last_result,result,10e-8 ) == 0)
        % determine which axis to move
        if(checkStep == 0)
            S = [1,0];
        else
            S = [0,1];
        end
        % probe
        S = double(Probe(func,2,result,S,probing_length,maxi));
        % get perfect lamda
        lamda = double(getLamda(func, result, S));
        if(length(lamda) == 1)
            fresult_last = fresult;
            f_result = subs(func, [x,y], result + lamda.*S);
        else
            for j = 1:length(lamda)
                if(isreal(lamda(j)))
                    real_lamda = lamda(j);
                end
            end
            fresult_last = fresult;
            f_result = subs(func,[x,y],result + real_lamda.*S);
            lamda = real_lamda;
        end
        if(lamda < 10e-8)
            break;
        end
        last_result = result;
        result = double(result) + lamda.*S;
        checkStep = mod(checkStep + 1,2);
    end
    disp('the final result of univariate is');
    disp(result);     
    disp(getValue(func,result));
end

