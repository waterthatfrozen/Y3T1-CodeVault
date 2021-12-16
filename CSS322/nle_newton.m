% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% NON-LINEAR EQUATION: NEWTON'S METHOD
% ----------------------------------------------
% In :  x0 = initial guess value
%        n = number of round you want to do
% Out: xk  = last approximated root of f(x)
%      fxk = value of f(xk)
% Example Usage: 
% [xk,fxk] = nle_newton(1,3);

% ** NOTE **
% Please specify your f(x) and f'(x) at the function below
% Otherwise, it wouldn't calculate for you.

function [xk,fxk] = nle_newton(x0,n)
    xk = x0;
    for i = 1:n
        xi = xk;
        [fxi,fpxi] = f(xi);
        xk = xi - fxi/fpxi;
        [fxk,~] = f(xk);
        fprintf("\nRound %d -------------\nx(k) = %.4f, f(x(k)) = %.4f, f'(x(k)) = %.4f\nx(k+1) = %.4f, f(x(k+1)) = %.4f\n",i,xi,fxi,fpxi,xk,fxk);
        if fxk == 0
           fprintf("\nRoot found!\nx = %.4f\n",xk);
           return;
        end
    end
end

function [fx,fpx] = f(x)
    % ex. f(x) = x^3+2x^2+x
    % change your f(x) and f'(x) here
    fx = (x^4)+(3*x^3)+(2*x^2);
    fpx = (4*x^3)+(9*x^2)+(4*x);
end