function lagr()
    % LAGRANGE INTERPOLATION
    % 0 Accept points input
    n = input("# of points? ");
    t = zeros(n,1); y = zeros(n,1);
    for i = 1:n
        t(i,1) = input(sprintf("t%d =? ",i));
        y(i,1) = input(sprintf("y%d =? ",i));
    end
    l = ones(n,1);
    % 1 calculate denominator of l_i(t)
    for i = 1:n
        for j = 1:n
            if i ~= j
               l(i) = l(i)*(t(i)-t(j)); 
            end
        end
    end
    % 2 Print out the equation
    disp("-----------------------");
    disp("The interpolating function is");
    fprintf("P%d(t) = \n",n-1);
    for i = 1:n
        if l(i) ~= 0
            [si,di] = sign(t(i)/l(i));
            fprintf("%s %.4f",si,di);
            for j = 1:n
                if i ~= j
                   fprintf("(t-%d)",t(j));
                end
            end
            fprintf("\n");
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