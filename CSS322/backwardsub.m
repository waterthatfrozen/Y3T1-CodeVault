function x = backwardsub(A,b)
    [n,~] = size(b);
    x = zeros(size(b));
    for j = n:-1:1
        x(j) = b(j)/A(j,j);
        for k = 1:j-1
           b(k) = b(k) - (A(k,j)*x(j));
        end
    end
end