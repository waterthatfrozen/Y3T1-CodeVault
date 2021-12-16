% CSS322 Project 2: Optimization
% Paphana Yiwsiw 6222780379
% Part II: Naive random search
% Out :  xk = last point
%       fxk = value of last point

function [xk,fxk] = naive_random()

    % set random seed
    s = rng;
    rng(1000);
    % create a perturbed f(x)
    [X,Y] = meshgrid(0:0.01:2*pi,0:0.01:2*pi);
    ZZ = rand(size(X));
    Z = sin(X)-cos(Y) + ZZ;
    
    % Naive random search implementation
    % random initial starting point
    xk = randi(629,2,1);
    fxk = Z(xk(1),xk(2));
    [neighborX,neighborY] = meshgrid(-2:2,-2:2);
    for k = 0:100
        % pick candiddate zk from neighbor of xk
        while true
            i = randi(24);
            if i >= 13
                zk(1) = xk(1) + neighborX(i+1); 
                zk(2) = xk(2) + neighborY(i+1);
            else
                zk(1) = xk(1) + neighborX(i); 
                zk(2) = xk(2) + neighborY(i);
            end
            % check if out of bound or not
            if (zk(1) >= 1 && zk(1) <= 629) && ...
               (zk(2) >= 1 && zk(2) <= 629)
                break
            end
        end
        % display candidate zk
        fzk = Z(zk(1),zk(2));
        % create x(k+1) for next round
        if fzk < fxk
            xkp1 = zk;
        else
            xkp1 = xk;
        end
        fxkp1 = Z(xkp1(1),xkp1(2));
        % display when k = 0,25,50,75,100
        if mod(k,25) == 0
            fprintf("\nk = %d\n",k);
            fprintf("x(k) = [ %d ; %d ]\nZ(x(k)) = %.4f\n",xk,fxk);
            fprintf("z(k) = [ %d ; %d ]\nZ(z(k)) = %.4f\n",zk,fzk);
            fprintf("x(k+1) = [ %d ; %d ]\nZ(x(k+1)) = %.4f\n",xk,fxkp1);
            fprintf("--------------------\n");
        end
        % move to next round
        xk = xkp1;
        fxk = fxkp1;
    end
    % end session
    rng(s);
end