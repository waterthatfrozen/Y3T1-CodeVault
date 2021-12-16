function [L,U,P] = GEPP(A)
   % Check Singular Matrix
   if det(A) == 0
      disp("Singular Matrix!");
      return 
   end
   % PTLU Factorization by GEPP
   [n,~] = size(A);
   P = eye(n);
   L = zeros(n);
   for k = 1:n
       % find max element in pivoting column
       [~,pv] = max(abs(A(k:n,k)));
       pv = pv+k-1;
       fprintf("Step %d\n",k);
       fprintf("exchange row %d and %d\n",k,pv);
       % exchange row in A,L,P
       if k ~= pv
           tempA = A(pv,:);
           A(pv,:) = A(k,:);
           A(k,:) = tempA;
           tempL = L(pv,:);
           L(pv,:) = L(k,:);
           L(k,:) = tempL;
           tempP = P(pv,:);
           P(pv,:) = P(k,:);
           P(k,:) = tempP;
       end
       piv = A(k,k);
       % update matrix
       for i = k+1:n
           mult = A(i,k)/piv;
           fprintf("Mult of R%d is %.4f\n",i,mult);
           for j = k:n
               A(i,j) = A(i,j) - (mult*A(k,j));
           end
           L(i,k) = mult;
       end
       L(k,k) = 1;
       % display solution at that step
       A,L,P
       disp("-----------------");
   end
   U = A;
end