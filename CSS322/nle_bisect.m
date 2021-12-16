% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% NON-LINEAR EQUATION: INTERVAL BISECTION METHOD
% ----------------------------------------------
% In : a,b = start and end of interval
%        n = number of round you want to do
% Out: xk  = last approximated root of f(x)
%      fxk = value of f(xk)
% Example Usage: 
% [xk,fxk] = nle_bisect(-0.5,0.5,3);

% ** NOTE **
% Please specify your f(x) at the function below
% Otherwise, it wouldn't calculate for you.

function [xk,fxk] = nle_bisect(a,b,n)
    if sign(f(a)) == sign(f(b)) || a>=b
        disp("Rejected input range a,b");
        xk = -Inf;
        fxk = -Inf;
        return
    else
        disp("Accepted input range a,b");
    end
    for i = 1:n
        fa = f(a);
        fb = f(b);
        m = a + (b-a)/2;
        fm = f(m);
        fprintf("Round %d\n[%.4f,%.4f] m = %.4f\n",i,a,b,m);
        fprintf("f(a) = %.4f, f(b) = %.4f, f(m) = %.4f\n",fa,fb,fm);
        if fm == 0
            fprintf("Root found\nx = %.4f\n", m);
            xk = m;
            fxk = 0;
            return
        end
        if sign(fa) ~= sign(fm)
            b = m;
        else
            a = m;
        end
    end
    % last midpoint as estimated root
    xk = a + (b-a)/2;
    fxk = f(xk);
    fprintf("Approx. root is %.4f, f(xk) = %.4f\n",xk,fxk);
end

% define f(x) and its derivative here
function fx = f(x)
    % ex. f(x) = x^3+2x^2+x
    % change your f(x) here
    fx = (x^4)+(3*x^3)+(2*x^2);   
end