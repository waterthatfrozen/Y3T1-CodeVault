% MATLAB CODE BY Paphana Y.
% From Scientific Computing Lecture
% PDE: FULLY DISCRETE METHOD FOR HEAT EQUATION
% ----------------------------------------------
% In :  c = c from u_t = c*u_xx defined by the question        
%       dx = delta x
%       dt = delta t
%      uin = initial interior point value
%      bnd = boundary condition value (u0 and un)
%        r = number of round you want to execute
% Out:  uk = solution to the PDE system
% Example Usage: 
% [uk] = pde_fd(1,0.25,0.25,[-0.4375,0.25,1.0625],[0,0],2)

function [uk] = pde_fd(c,dx,dt,uin,bnd,r)
    n = length(uin)+2;
    uk = zeros(1,n);
    uk(1,1) = bnd(1,1);
    uk(1,n) = bnd(1,2);
    uk(1,2:n-1) = uin;
    fprintf("\nRound 0\n");
    disp(uk');
    for round = 1:r
        ukp1 = zeros(1,n);
        for i = 2:n-1
            ukp1(i) = uk(i) + ((c*dt)/(dx^2))*(uk(i+1)-(2*uk(i))+uk(i-1));
        end
        fprintf("\nRound %d\n",round);
        disp(ukp1');
        uk = ukp1;
    end
    uk = uk';
end