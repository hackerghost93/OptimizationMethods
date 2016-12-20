%main

% create symbols syms s1 s2 s3
% clear syms will clear all
% subs will subsitute every occurence and evaluate
% subs(f , value ) 

%%
clc
syms x y
f = x^2 + y^2;
%ezmesh(f);
UniVariant(f, [3 3], 0);
Powell(f,2,[3,3],0);

%%
clc
f = (1 - x)^2 + 100 * (y^2 - x^2)^2;
%ezmesh(f);
UniVariant(f, [1 1], 0);
Powell(f,2,[1 1],0);



%%
clc
syms x y
f = -cos(x) * cos(y) * exp(((x - pi)^2 + (y - pi)^2));
Powell(f,2,[2,2],0);
UniVariant(f, [2 2], 0);
%   f = x - y + 2.*(x.^2)+ 2*x*y + (y.^2)


%%
syms x y
f = 1 * (y - 5.1/(4 * pi^2) * x^2 + 5/pi * x - 6)^2 + 10 * (1 -  1/(8 * pi)) * cos(x) + 10;
%ezmesh(f);
Powell(f,2,[1,1],0);
UniVariant(f, [0 0], 0);
