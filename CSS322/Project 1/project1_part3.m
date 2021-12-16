% CSS322 Scientific Computing
% Project 1 Part 3
% Paphana Yiwsiw 6222780379 Sec.3
clc;
% 1 Generate Problem's Toeplitz matrix
n = 10;
A = eye(n);
for i = 1:n-1
    A(i,i+1) = 3;
end

% 2 find the answer
fprintf('A = \n');
disp(A);
fprintf('\nrank(A) = %d\n',rank(A));
fprintf('det(A) = %d\n',det(A));
fprintf('Eigenvalues of A =\n');
inv(A)
disp(eig(A));

%% Apply GSB
[Q,R] = gsb(A)