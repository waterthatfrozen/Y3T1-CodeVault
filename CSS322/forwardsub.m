function w = forwardsub(A,b)
    [n,~] = size(b);
    w = zeros(size(b));
    for j = 1:n
       w(j) = b(j)/A(j,j);
       for k = j+1:n
           b(k) = b(k) - (A(k,j)*w(j));
       end
    end
end