function [ lamda ] = getLamda(func, X, Step)
    syms x y v
    % l is lamda
    val = X+(v.*Step);
    lamda = [];
    lamdaFunction = subs(func,[x,y],val);
    answers = solve(diff(lamdaFunction,v) == 0);  % solve first differentiation
    for i = 1:length(answers)
        if(isreal(answers(i)))
            lamda = [lamda answers(i)]; 
        end
    end
end

