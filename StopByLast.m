function [ bool ] = StopByLast( result,last,threshold )
    bool = 1;
    for i = 1: length(last)
        if(abs(result(i) - last(i)) > threshold)
            bool = 0;
        end
    end
end

