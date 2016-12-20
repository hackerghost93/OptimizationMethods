function [ value ] = getValue( func,point )
    syms x y
    value = double(subs(func,[x,y],point));
end

