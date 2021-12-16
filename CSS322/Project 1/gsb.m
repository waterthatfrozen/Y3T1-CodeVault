% CSS322 Scientific Computing
% Project 1
% Gram-Schmidt Algorithm for QR factorization
% Part 1 - Gram-Schmidt-B
% Input:  A -> nxn matrix
% Output: Q,R -> nxn matrix
% Paphana Yiwsiw 6222780379 Sec.3

function [Q,R] = gsb(A)
    [n,~] = size(A);
    Q = zeros(n);
    R = zeros(n);
    V = A;              % equivalent to v_i = a_i
    for i = 1:n
        R(i,i) = norm(V(:,i),2);
        Q(:,i) = V(:,i) / R(i,i);
        for j = i+1:n
           R(i,j) = Q(:,i)'* V(:,j);
           V(:,j) = V(:,j) - R(i,j)*Q(:,i);
        end
    end
end