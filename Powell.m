function [ result ] = Powell(func,variable_num,result, maxi)
    probing_length = 0.01;
    variable_num = 2;
    
    S = [1 0;0 1]; %for 2 directions
    selector = [2 1 2]; 
    last_value = result + 1;
    while(StopByLast( result,last_value,10e-4 ) == 0)
        for i = 1:variable_num+1
            % each cycle compute the result and save the first one
            % probe with selector column
            Dir = Probe(func,variable_num ,result, S(selector(i),:), probing_length, maxi);
            lamda = getLamda(func, result, Dir);
            if(i == 1)
                Z = result + lamda.*Dir;
            end
            last_value = result;
            result = result + (lamda.*Dir);
        end
        % shift them
        S = circshift(S,1);
        S(variable_num,:) = result - Z;
    end
    disp('the final result is \n');
    disp(result);
end

