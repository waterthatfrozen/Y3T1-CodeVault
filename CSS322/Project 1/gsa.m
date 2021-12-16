% CSS322 Scientific Computing
% Project 1
% Gram-Schmidt Algorithm for QR factorization
% Part 1 - Gram-Schmidt-A
% Input:  A -> nxn matrix
% Output: Q,R -> nxn matrix
% Paphana Yiwsiw 6222780379 Sec.3

function [Q,R] = gsa(A)
    [n,~] = size(A);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
       v_i = A(:,i);
       for j = 1:i-1
          R(j,i) = Q(:,j)'*A(:,i);
          v_i = v_i - R(j,i)*Q(:,j);
       end
       R(i,i)= norm(v_i,2);
       Q(:,i) = v_i/R(i,i);
    end
end