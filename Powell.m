function [ result ] = Powell(func,variable_num,result, maxi)
    probing_length = 0.01;
    variable_num = 2;
    
    S = [1 0;0 1] %for 2 directions
    selector = [2 1 2]; 
    last_value = ones(variable_num,1);
    while( 1)
        for i = 1:variable_num+1
            % each cycle compute the result and save the first one
            % probe with selector column
            Dir = Probe(func,variable_num ,result, S(selector(i),:), probing_length, maxi);
            lamda = getLamda(func, result, Dir);
            if(i == 1)
                Z = result + lamda.*Dir;
            end
            last_value = result;
            result = result + (lamda.*Dir)
        end
        % change selector 
        % new selector = 
        S = circshift(S,1);
        S(variable_num,:) = result - Z;
        input('next Iteration');
    end
    

end

