function normv(x)
    % 1-/2-/Inf-Norm of Vector
    % or 1-/fro-/Inf-Norm of Matrix
    [~,col] = size(x);
    if col == 1
       % vector
       fprintf("1-Norm = %.4f\n",norm(x,1));
       fprintf("2-Norm = %.4f\n",norm(x,2));
       fprintf("Inf-Norm = %.4f\n",norm(x,Inf));
    else
       % matrix
       fprintf("Fro-Norm = %.4f\n",norm(x,'fro'));
       fprintf("1-Norm = %.4f\n",norm(x,1));
       fprintf("Inf-Norm = %.4f\n",norm(x,Inf));
    end
end