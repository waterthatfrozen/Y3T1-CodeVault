function x = mono()
    % INTERPOLATION ON MONOMIAL BASIS
    % 0 Accept n points input
    n = input("# of points? ");
    t = zeros(n,1); y = zeros(n,1);
    for i = 1:n
        t(i,1) = input(sprintf("t%d =? ",i));
        y(i,1) = input(sprintf("y%d =? ",i));
    end
    % 0.1 Prepare matrix A & vector y
    A = zeros(n);
    for i = 1:n
        for j = 1:n
            A(i,j) = t(i)^(j-1);
        end
    end
    % 0.2 Print column
    A
    disp("-----------------------");
    % 1 PTLU Factorization
    [L,U,P] = GEPP(A);
    L,U,P
    disp("-----------------------");
    % 2 Solve Equation
    y_hat = P * y;
    w = forwardsub(L,y_hat);
    x = backwardsub(U,w);
    % 2.1 printout w and x
    w,x
    disp("-----------------------");
    % 3 Print out the equation
    disp("The interpolating function is");
    fprintf("P%d(t) = \n",n-1);
    for i = 0:n-1
        [si,xi_abs] = sign(x(i+1));
        if xi_abs == 0
            continue
        else
            if i == 0
                fprintf("%s %3.4f\n",si,xi_abs);
            elseif i == 1
                fprintf("%s %3.4f x\n",si,xi_abs);
            else
                fprintf("%s %3.4f x^%d\n",si,xi_abs,i);
            end
        end
    end
end

function [s,x_abs] = sign(x)
    if x >= 0
        s = "+";
    else
        s = "-";
    end
    x_abs = abs(x);
end