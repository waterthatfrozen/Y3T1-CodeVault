function mtx = mtc()
    % matrix creator; for quicker matrix input
    m = input("# of matrix row? ");
    n = input("# of matrix col? ");
    mtx = zeros(m,n);
    for i = 1:m
        for j = 1:n
            mtx(i,j) = input(sprintf("A %d,%d? ",i,j));
        end
    end
end