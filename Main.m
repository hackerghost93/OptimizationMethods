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
a = UniVariant(f, [3 3], 0);
b = Powell(f,2,[3,3],0);
c = Marquardt(f, 3,3, 50);
double(c);
c = transpose(c);
results = [a;b;c]; 
scatter(results(:,1),results(:,2)); 

%%
clc
f = (1 - x)^2 + 100 * (y^2 - x^2)^2;
%ezmesh(f);
a = UniVariant(f, [0 0], 0);
b = Powell(f,2,[0 0],0);
c = Marquardt(f, 0,0, 50);
double(c);
c = transpose(c);
results = [a;b;c]; 
scatter(results(:,1),results(:,2)); 

%% rastrigiean
clc
syms x y
A = 10;
f = A * 2 + (x^2 - A * cos(2 * pi * x)) + (y^2 - A * cos(2 * pi * y));
a = UniVariant(f, [1 1], 0);
b = Powell(f,2,[1 1],0);
c = Marquardt(f, -2,-2, 1000);
double(c);
getValue(f,[1 1])
c = transpose(c);
results = [a;b;c]; 
scatter(results(:,1),results(:,2)); 
%%
clc
syms x y
f = -cos(x) * cos(y) * exp(((x - pi)^2 + (y - pi)^2));
b = Powell(f,2,[2,2],0);
a = UniVariant(f, [2 2], 0);
c = Marquardt(f, -2,-2, 1000);
double(c);
getValue(f,[1 1])
c = transpose(c);
results = [a;b;c]; 
scatter(results(:,1),results(:,2)); 
%   f = x - y + 2.*(x.^2)+ 2*x*y + (y.^2)


%%
syms x y
f = 1 * (y - 5.1/(4 * pi^2) * x^2 + 5/pi * x - 6)^2 + 10 * (1 -  1/(8 * pi)) * cos(x) + 10;
%ezmesh(f);
a = Powell(f,2,[1,1],0);
b = UniVariant(f, [0 0], 0);
c = Marquardt(f, -2,-2, 1000);
double(c);
getValue(f,[3.1418 2.2738])
c = transpose(c);
results = [a;b;c]; 
scatter(results(:,1),results(:,2)); 
