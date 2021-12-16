% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% EIGENVALUE & EIGENVECTOR: RAYLEIGH QUOTIENT
% ----------------------------------------------
% In :   A = square matrix nxn A 
%       x0 = eigenvector
% Out:  ld = associated eigenvalue with that eigenvector
% Example Usage: 
% [ld] = eig_rayq([2 0;0 2],[1/sqrt(2);1/sqrt(2)])

function [ld] = eig_rayq(A,xk)
    ld = (xk'*A*xk)/(xk'*xk);
end