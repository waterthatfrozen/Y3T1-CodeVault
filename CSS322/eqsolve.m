function [w,x] = eqsolve(A,b)
    [L,U,P] = lu(A);
    b_hat = P*b;
    w = forwardsub(L,b_hat);
    x = backwardsub(U,w);
end