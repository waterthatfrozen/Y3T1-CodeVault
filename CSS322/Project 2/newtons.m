% CSS322 Project 2: Optimization
% Paphana Yiwsiw 6222780379
% Part I: Newton's Method
% (Newton's method for uncontraint optimization)

function [xk,fxk] = newtons()
    % set random seed
    s = rng;
    rng(100);
    % Random initial value
    xk = rand(2,1);
    fxk = f(xk);
    gfxk = gradientf(xk);
    hfxk = hessianf(xk);
    % Newton's method implementation
    for k = 0:15
        % solve linear system of equation for h(k)
        hk = linearsolve(hfxk,-gfxk);
        % calculate x(k+1)
        xkp1 = xk + hk;
        fxkp1 = f(xkp1);
        % report value
        if mod(k,5) == 0
            fprintf("\nk = %d\n",k);
            fprintf("x(k) = [ %.4f ; %.4f ]\n",xk);
            fprintf("f(x(k)) = %.4f\n",fxk);
            fprintf("x(k+1) = [ %.4f ; %.4f ]\n",xkp1);
            fprintf("f(x(k+1)) = %.4f\n",fxkp1);
        end
        % update xk, gradient, and hessian matrix
        xk = xkp1;
        fxk = fxkp1;
        hfxk = hessianf(xkp1);
        gfxk = gradientf(xkp1);
    end
    % end session
    rng(s);
end

% given function f(x)
function [fx] = f(x)
    fx = sin(x(1))-cos(x(2));
end

% gradient of fx
function [gfx] = gradientf(x)
    gfx = [cos(x(1));sin(x(2))];
end

% hessian matrix of fx
function [hfx] = hessianf(x)
    hfx = [-sin(x(1)), 0; 0, cos(x(2))];
end

function [x] = linearsolve(A,b)
    % PTLU factorization
    [L,U,P] = lu(A);
    % b_hat = P*b
    b_hat = P*b;
    % L*w=b_hat by forward substitution
    w = forwardsub(L,b_hat);
    % U*x=w by backward substitution
    x = backwardsub(U,w);
end

function w = forwardsub(L,b)
    [n,~] = size(b);
    w = zeros(size(b));
    for j = 1:n
       w(j) = b(j)/L(j,j);
       for k = j+1:n
           b(k) = b(k) - (L(k,j)*w(j));
       end
    end
end

function x = backwardsub(U,b)
    [n,~] = size(b);
    x = zeros(size(b));
    for j = n:-1:1
        x(j) = b(j)/U(j,j);
        for k = 1:j-1
           b(k) = b(k) - (U(k,j)*x(j));
        end
    end
end