function x = bestfit()
    % BEST FIT LINE FOR LINE Y=AX+B
    % 0 Accept points input
    n = input("# of points? ");
    t = zeros(n,1); y = zeros(n,1);
    for i = 1:n
        t(i,1) = input(sprintf("t%d =? ",i));
        y(i,1) = input(sprintf("y%d =? ",i));
    end
    A = ones(n,2);
    A(:,1) = t;
    ATA = A' * A;
    ATb = A' * y;
    % 1 Cholesky's Factorization (A = L*LT)
    L = chol(ATA,'lower')
    LT = L';
    disp("-----------------------");
    % 2 forward subsitution (Lw = ATb)
    w = forwardsub(L,ATb)
    disp("-----------------------");
    % 3 backward subsitution (LTx = w)
    x = backwardsub(LT,w)
    disp("-----------------------");
    % 4 equation printout
    fprintf("The best-fitted equation is\n");
    fprintf("Y = (%.4f)X + (%.4f)\n",x(1),x(2));
end