function LamdaOpt = EvaluateLamda(objfnc , x0)
 syms x y lamda 
 grad = gradient(objfnc , x , y );
 f=subs(grad,{x,y},x0);
 f1=x0-lamda*f;
 g=subs(objfnc,{x,y},f1);
  LamdaOpt = solve (diff(g) == 0);
end

