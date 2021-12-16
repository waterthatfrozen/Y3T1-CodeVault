% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% ITERATIVE METHOD FOR LINEAR EQUATION: GAUSS-SEIDEL METHOD
% ----------------------------------------------
% In : A,b = Matrix A and b in Ax=b
%       x0 = initial value
%        r = number of round you want to do
% Out:  xn = last approximated solution of Ax=b
% Example Usage: 
% [xn] = it_gs(A,b,x0,2);

function [xn] = it_gs(A,b,x0,r)
    n = size(A);
    xk = x0;
    for round = 1:r
        xkp1 = b;
        for i = 1:n
            for j = 1:n
                if j<i
                    xkp1(i) = xkp1(i) - (A(i,j)*xkp1(j));
                elseif j>i
                    xkp1(i) = xkp1(i) - (A(i,j)*xk(j));
                end
            end
            xkp1(i) = xkp1(i)/A(i,i);
        end
        xn = xkp1;
        fprintf("\nRound %d\n",round);
        disp(xn);
        xk = xkp1;
    end
end