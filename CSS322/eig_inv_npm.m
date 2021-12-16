% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% EIGENVALUE & EIGENVECTOR: INVERSE NORMALIZE POWER METHOD
% ----------------------------------------------
% In :   A = square matrix nxn A 
%       x0 = initial guess of eigenvector
%        r = number of round you want to execute
% Out:  xk = approximated eigenvalue
% Example Usage: 
% [xk] = eig_inv_npm([2 0;0 2],[1;1],2)

function [xk] = eig_inv_npm(A,x0,r)
    xk = x0;
    Ainv = inverseGEPP(A);
    disp("Inverse of matrix A");
    disp(Ainv);
    for round = 1:r
        xkp1bfn = Ainv*xk;
        normxkp1 = norm(xkp1bfn,2);
        xkp1 = xkp1bfn / normxkp1;
        fprintf("Round %d\n",round);
        disp("Before normalize");
        disp(xkp1bfn);
        fprintf("Vector norm\n%.4f\n\n",normxkp1);
        disp("After normalize");
        disp(xkp1);
        xk = xkp1;
    end
end