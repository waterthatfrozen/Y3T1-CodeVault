% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% EIGENVALUE & EIGENVECTOR: INVERSE NORMALIZE SHIFTED POWER METHOD
% ----------------------------------------------
% In :   A = square matrix nxn A 
%        s = sigma shifted value]
%       x0 = initial guess of eigenvector
%        r = number of round you want to execute
% Out:  xk = approximated eigenvalue
% Example Usage: 
% [xk] = eig_inv_npm_sft([2 0;0 2],[1;1],2)

function [xk] = eig_inv_npm_sft(A,s,x0,r)
    xk = x0;
    Adsi = A - (s*eye(size(A)));
    disp("A - SI");
    disp(Adsi);
    Ainv = inverseGEPP(Adsi);
    disp("Inverse of matrix A - SI");
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