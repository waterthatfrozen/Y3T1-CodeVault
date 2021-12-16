% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% EIGENVALUE & EIGENVECTOR: POWER METHOD
% ----------------------------------------------
% In :   A = square matrix nxn A 
%       x0 = initial guess of eigenvector
%        r = number of round you want to execute
% Out:  xk = approximated eigenvalue
% Example Usage: 
% [xk] = eig_pm([3 -1;-1 3],[1;0],3)

function [xk] = eig_pm(A,x0,r)
    xk = x0;
    for round = 1:r
        xkp1 = A*xk;
        fprintf("Round %d\n",round);
        disp(xkp1);
        xk = xkp1;
    end
end