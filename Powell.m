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
            lamda = double(getLamda(func, result, Dir));
            if(length(lamda) ~= 1)
                mini = 10000;
                miniIndex = 1;
               for k = 1: length(lamda)
                  temp = getValue(func,double(result) + lamda(k).*Dir);
                  if(temp < mini)
                      mini = temp;
                      miniIndex = k;
                  end
               end
            else
                k = 1;
            end
            if(i == 1)
                Z = double(result) + lamda(k).*Dir;
            end
            last_value = double(result);
            result = double(result) + (lamda(k).*Dir);
        end
        % shift them
        S = circshift(S,1);
        S(variable_num,:) = result - Z;
    end
    disp('the final result of powell method is \n');
    disp(result);
    disp(getValue(func,result));
end

