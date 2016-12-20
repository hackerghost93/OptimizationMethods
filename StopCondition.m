function [ bool ] = StopCondition( func, point )
    syms x y
    point
    diffs = gradient(func,[x,y])
    results = subs(diffs,[x,y],point)
    bool = 1;
    for i = 1 : length(results)
        if(abs(results(i)) > 10e-6)
            bool = 0;
            break;
        end
    end 
end

