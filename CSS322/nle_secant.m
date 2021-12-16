% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% NON-LINEAR EQUATION: SECANT METHOD
% ----------------------------------------------
% In :  x0 = initial guess value
%        n = number of round you want to do
% Out: xk  = last approximated root of f(x)
%      fxk = value of f(xk)
% Example Usage: 
% [xk,fxk] = nle_secant(1,3);

% ** NOTE **
% 1. Please specify your f(x) at the function below
%    Otherwise, it wouldn't calculate for you.
% 2. The first round it will be calculated by using newton's method,
%    so please specify the f(x) in nle_newton too.

function [xk,fxk] = nle_secant(x0,n)
    % Note for maintainance
    % xk0 = x(k-1), xk1 = x(k), xk = x(k+1)
    xk0 = x0;
    fxk0 = f(xk0);
    [xk1,fxk1] = nle_newton(xk0,1);
    for i = 2:n
        xk = xk1 - (fxk1*(xk1-xk0))/(fxk1-fxk0);
        fxk = f(xk);
        fprintf("\nRound %d -------------\n",i);
        fprintf("x(k-1) = %.4f, f(x(k-1)) = %.4f\n",xk0,fxk0);
        fprintf("x(k)   = %.4f, f(x(k))   = %.4f\n",xk1,fxk1);
        fprintf("x(k+1) = %.4f, f(x(k+1)) = %.4f\n",xk,fxk);
        if fxk == 0
           fprintf("\nRoot found!\nx = %.4f\n",xk);
           return;
        end
        xk0 = xk1; xk1 = xk;
        fxk0 = fxk1; fxk1 = fxk;
    end
end

function fx = f(x)
    % ex. f(x) = x^3+2x^2+x
    % change your f(x) and f'(x) here
    fx = (x^4)+(3*x^3)+(2*x^2);
end