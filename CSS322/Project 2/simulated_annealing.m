% CSS322 Project 2: Optimization
% Paphana Yiwsiw 6222780379
% Part III (Extra Credit): Simulated annealing algorithm
% Out :  best_state = best-so-far point
%        best_value = value of best-so-far point

function [best_state,best_value] = simulated_annealing()
    % set random seed
    s = rng;
    rng(2000);
    
    % create a perturbed f(x)
    [X,Y] = meshgrid(0:0.01:2*pi,0:0.01:2*pi);
    ZZ = rand(size(X));
    Z = sin(X)-cos(Y) + ZZ;
    
    % simulated annealing algorithm implementation
    % random initial starting point
    xk = randi(629,2,1);
    fxk = Z(xk(1),xk(2));
    best_state = xk;
    best_value = fxk;
    
    [neighborY,neighborX] = meshgrid(-2:2,-2:2);
    for k = 0:100
        tk = hajek_cooling(k);
        if tk == 0
            break 
        end
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
        coin_toss = rand();
        accpt_prob = acceptance_prob(tk,fzk,fxk);
        % compare coin_toss with acceptance probability
        if coin_toss < accpt_prob
            xkp1 = zk;      % HEAD
        else
            xkp1 = xk;      % TAIL
        end
        fxkp1 = Z(xkp1(1),xkp1(2));
        % display when k = 0,25,50,75,100
        if mod(k,25) == 0
            fprintf("\nk = %d\n",k);
            fprintf("tk = %.4f\n",tk);
            fprintf("x(k) = [ %d ; %d ]\nZ(x(k)) = %.4f\n",xk,fxk);
            fprintf("z(k) = [ %d ; %d ]\nZ(z(k)) = %.4f\n",zk,fzk);
            fprintf("coin toss = %.4f\n",coin_toss);
            fprintf("acceptance prob. = %.4f\n",accpt_prob);
            fprintf("x(k+1) = [ %d ; %d ]\nZ(x(k+1)) = %.4f\n",xkp1,fxkp1);
            fprintf("------------------\n");
        end
        % move to next round
        xk = xkp1;
        fxk = fxkp1;
        % record best-so-far point
        if fxk < best_value
            best_state = xk;
            best_value = fxk;
        end
    end
    
    % end session
    rng(s);
    
    % display best value and best state
    fprintf("best_state = [ %d ; %d ]\n",best_state);
    fprintf("best_value = %.4f\n",best_value);
end

function [p] = acceptance_prob(tk,fzk,fxk)
    prob = exp(-(fzk-fxk)/tk);
    p = min([1,prob]);
end

function [tk] = hajek_cooling(k)
    gamma = 2;
    tk = gamma/log10(k+2);
end