% CSS322 Scientific Computing
% Homework 2 Problem 8a 
% Compute the inverse of matrix using GEPP Method
% Paphana Y. 6222780379 16.09.2021

function inv = inverseGEPP(A)
    [n,~] = size(A);
    [L,U,P] = lu(A);
    I = eye(n);
    inv = zeros(n);
    
    for i = 1:n
        % 1 e_i_hat = P*e_i
        e_i_hat = P*I(:,i);
        % 2 L*w_i = e_i_hat (forward substitution)
        w_i = zeros(size(e_i_hat));
        for j = 1:n
           w_i(j) = e_i_hat(j)/L(j,j);
           for k = j+1:n
               e_i_hat(k) = e_i_hat(k) - (L(k,j)*w_i(j));
           end
        end
        % 3 U*x_i = w_i (back substitution)
        x_i = zeros(size(w_i));
        for j = n:-1:1
            x_i(j) = w_i(j)/U(j,j);
            for k = 1:j-1
               w_i(k) = w_i(k) - (U(k,j)*x_i(j));
            end
        end
        % 4 assign x_i to inv column i
        inv(:,i) = x_i;
    end
end