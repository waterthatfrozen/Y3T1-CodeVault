% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% ITERATIVE METHOD FOR LINEAR EQUATION: JACOBI METHOD
% ----------------------------------------------
% In : A,b = Matrix A and b in Ax=b
%       x0 = initial value
%        r = number of round you want to do
% Out:  xn = last approximated solution of Ax=b
% Example Usage: 
% [xn] = it_jacobi(A,b,x0,2);

function [xn] = it_jacobi(A,b,x0,r)
    n = size(A);
    xi = b;
    % first round
    for i = 1:n
        for j = 1:n
            if i ~= j
                xi(i) = xi(i) - (A(i,j)*x0(j));
            end
        end
        xi(i) = xi(i)/A(i,i);
    end
    xn = xi;
    fprintf("\nRound %d\n",1);
    disp(xn);
    % 2nd and other round
    for round = 2:r
        xkp1 = b; 
        for i = 1:n
            for j = 1:n
               if i ~= j
                  % here
                  xkp1(i) = xkp1(i) - (A(i,j)*xn(j));
               end
            end
            xkp1(i) = xkp1(i)/A(i,i);
        end
        xn = xkp1;
        fprintf("Round %d\n",round);
        disp(xn);
    end
end