function newton()
    % INTERPOLATION ON NEWTON BASIS
    % 0 Accept points input
    n = input("# of points? ");
    t = zeros(n,1); y = zeros(n,1);
    for i = 1:n
        t(i,1) = input(sprintf("t%d =? ",i));
        y(i,1) = input(sprintf("y%d =? ",i));
    end
    % 0.1 Setup matrix A
    A = tril(ones(n));
    for i = 2:n
        for j = 2:n
            if i >= j
               for k = 1:j-1
                  A(i,j) = A(i,j) * (t(i) - t(k)); 
               end
            end
        end
    end
    % show matrix A
    A
    disp("-----------------------");
    % 1 forward subsitution
    x = forwardsub(A,y);
    x
    disp("-----------------------");
    % 2 Print out the equation
    disp("The interpolating function is");
    fprintf("P%d(t) = \n",n-1);
    for i = 1:n
      [si,xi_abs] = sign(x(i));
      fprintf("%s %.4f",si,xi_abs);
      for j = 1:i
         fprintf("(t-%d)",t(j)); 
      end
      fprintf("\n");
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