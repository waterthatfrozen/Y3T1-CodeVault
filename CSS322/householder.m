function [Q,R,x] = householder(A,b)
    % QR TRANSFORMATION BY HOUSEHOLDER METHOD
    [row,col] = size(A);
    AA = A;
    H_all = zeros([row row col]);
    for i = 1:col
        ai = AA(:,1);
        fprintf("a\n");
        disp(ai);
        if ai(1) >= 0
            alpha = -norm(ai);
        else
            alpha = norm(ai);
        end
        fprintf("alpha %d = %.4f\n",i,alpha);
        v = ai - alpha*eye(row-i+1,1);
        disp(v);
        fprintf("H%d'\n",i);
        hi = eye(row-i+1) - 2*((v*v')/(v'*v));
        disp(hi);
        if i > 1
            fprintf("H%d\n",i);
            hii = eye(row);
            hii(i:end,i:end) = hi;
            disp(hii);
            H_all(:,:,i) = hii;
        else
            H_all(:,:,i) = hi;
        end
        fprintf("H%d...H1A\n",i);
        HiA = hi * AA;
        disp(HiA);
        AA = HiA(2:end,2:end);
        disp("------------------------------");
    end
    R = A;
    Q = H_all(:,:,1);
    for i = 1:col
        R = H_all(:,:,i) * R;
        if i ~= 1
            Q = Q * H_all(:,:,i);
        end
    end
    disp("R");
    disp(R);
    disp("Q");
    disp(Q);
    for i = 1:col
       fprintf("H%d\n",i);
       disp(H_all(:,:,i));
    end
    disp("------------------------------");
    c = zeros(row,1);
    for i = 1:col
        fprintf("Step %d\n",i);
        if i == 1
            Hib = H_all(:,:,1) * b
            w1 = Hib(1)
            w2 = Hib(2:end)
        else
            Hip = H_all(:,:,i)
            Hipw2 = Hip(i:end,i:end) * w2
            w1 = Hipw2(1)
            w2 = Hipw2(2:end)
        end
        c(i) = w1;
        disp("------------------------------");
    end
    c(i+1:end) = w2;
    disp("c");
    disp(c);
    disp("------------------------------");
    R1 = R(1:col,1:col)
    c1 = c(1:col)
    x = backwardsub(R1,c1);
    disp("x");
    disp(x);
    disp("------------------------------");
end