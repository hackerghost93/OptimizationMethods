 %Parameters:
 %  z = f(x, y)
 %  [xi, yi] the initial starting point
 %  N the number of iterations
function f = Marquardt(z, xi, yi, N)
    syms x y;
    alpha = 10000; %Constant alpha on the order of 10^4.
    c1 = 0.5; %Value between 0 and 1.
    c2 = 2; %Value greater than 1.
    dfdx = diff(z, x);%Partial x.
    dfdy = diff(z, y);%Partial y.
    df2dx2 = diff(dfdx, x);%Second partial x.
    df2dxdy = diff(dfdx, y);%Second partial for x with respect to y.
    df2dydx = diff(dfdy, x);%Second partial for y with respect to x will be equal to df2dxdy if the function is continuous.
    df2dy2 = diff(dfdy, y);%Second partial y.
    H = [df2dx2 df2dxdy; df2dydx df2dy2]; %Hessian matrix
    I = [1 0; 0 1]; %Identity matrix
    x0 = [xi;yi];%Let x0 be 1, 1
    gradF = [dfdx;dfdy];%gradient.

    %N = 10;%Number of iterations.
    
    EPS = 0.01;
    xi = x0;
    
    for i = 1: N
        gradFi = subs(gradF, [x;y], xi);%Gradient using this xi.
        gradFi1 = gradFi(1);
        gradFi2 = gradFi(2);
        gradMagnitude = sqrt(gradFi1 * gradFi1 + gradFi2 * gradFi2);
        if(gradMagnitude < EPS) %Stopping condition on Epsilon.
            break;%Optimal solution reached.
        end
        Hi = subs(H, [x;y], xi);%Hessian matrix for this iteration.
        xNew = xi - inv(Hi + (alpha * I)) * gradFi;%Get Xi+1.
        
        fOld = subs(z, [x;y], xi);
        fNew = subs(z, [x;y], xNew);
        
        if(fNew < fOld)
            alpha = c1 * alpha;
        else
            alpha = c2 * alpha;
        end
        xi = xNew;
    end
    display('Marquardt final answer');
    f = double(xi);
    disp(f);
    %print xi %tracing
end