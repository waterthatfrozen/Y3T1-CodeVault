# CSS322 Scientific Computing
This is how to use all of my MATLAB code in this folder.\
All codes written based on pseudocode from CSS322 lectures in semester 1/2021, SIIT.\
To use the code, type the command given in the example usage to the command window of MATLAB.

## Projects
- Project 1: QR-factorization using Gram-Schmidt Algorithm 
- Project 2: Global optimization of f(x)
- Please read the problem statement file for more information about each project.

## Before Midterm Part

01. mtc -> matrix creation
- Usage: ```A = mtc```
- Description: This is to create MxN matrix from your keyboard input faster than traditional way.

02. GEPP -> PTLU Factorization using GEPP
- Usage: ```[L,U,P] = GEPP(A)```
- Restriction: Matrix A is non-singular square matrix
- Description: This is GEPP and all steps to solve it. \
It is equivalent to built-in MATLAB function [L,U,P] = lu(A)

03. forwardsub -> Forward Substitution
- Usage: ```x = forwardsub(L,b)```
- Restriction: L must be lower-triangular matrix

04. backwardsub -> Backward Substitution
- Usage: ```x = backwardsub (U,b)```
- Restriction: U must be upper-triangular matrix

05. eqsolve -> Solve system of linear equations
- Usage: ```[w,x] = eqsolve(A,b)```
- Description: Solve system of linear equation of Ax=b.
- w is from Lw = b. and x is from Ux = w
- This function uses 4-step solving equation.

06. mono -> Interpolation on Monomial Basis
- Usage: ```x = mono()```
- Description: output the interpolating function from given n points input on monomial basis.
- Noted that there will be a prompt asking for input. You have to input number of points first, then t_i and y_i of each point.

07. lagr -> Lagrange Interpolation
- Usage: ```lagr```
- Description: output the interpolating function from given n points input using lagrange method.
- Noted that there will be a prompt asking for input. You have to input number of points first, then t_i and y_i of each point.

08. newton -> Interpolation on Newton Basis
- Usage: ```newton```
- Description: output the interpolating function from given n points input on newtonian basis.
- Noted that there will be a prompt asking for input. You have to input number of points first, then t_i and y_i of each point.

09. inverseGEPP -> finding inverse matrix by using GEPP method
- Usage: ```A_inv = inverseGEPP(A)```
- Description: finding inverse matrix by using GEPP method, this code is from Homework 2 Question 8a

10. bestfit -> best-fitted line on y=ax+b
- Usage: ```x = bestfit()```
- Description: finding best-fitted line in form of **y=ax+b** in linear least square (LLS) problem.
- It will also show solution in each step e.g. L from cholesky factorization and result from forward and backward substitution.
- Noted that there will be a prompt asking for input. You have to input number of points first, then t_i and y_i of each point.

11. householder -> QR Factorization using HOUSEHOLDER method
- Usage: ```[Q,R,x] = householder(A,b)```
- Description: QR Factorization using HOUSEHOLDER method and finding the x, answer to the system, at the end.

12. normv -> finding norm
- Usage: ```norm(x)```
- x can be either vector or matrix, the output will show accordingly.
- Description: output the 1-,2-,and Inf-norm if input x is vector, and 1-,Inf-, and frobenius-norm if input x is matrix.

---------------------------------------------------------------

## After Midterm Part
01. nle_bisect -> interval bisection
- Example Usage: 
```[xk,fxk] = nle_bisect(-0.5,0.5,3)```

02. nle_newton -> newton's method in non-linear equation
- Example Usage: 
```[xk,fxk] = nle_newton(1,3)```

03. nle_secant -> secant method in non-linear equation
- Example Usage: 
```[xk,fxk] = nle_secant(1,3)```

04. eig_pm -> power method in eigenvector
- Example Usage: 
```[xk] = eig_pm([3 -1;-1 3],[1;0],3)```

05. eig_npm -> normalized power method in eigenvector
- Example Usage: 
```[xk] = eig_npm([2 0;0 2],[1;1],2)```

06. eig_inv_npm -> inverse normalized power method in eigenvector
- Example Usage: 
```[xk] = eig_inv_npm([2 0;0 2],[1;1],2)```

07. eig_inv_npm_sft -> inverse shifted normalized power method in eigenvector
- Example Usage: 
```[xk] = eig_inv_npm_sft([2 0;0 2],[1;1],2)```

08. eig_rayq -> rayleigh's quotient for finding eigenvalue associated with eigenvector
- Example Usage: 
```[ld] = eig_rayq([2 0;0 2],[1/sqrt(2);1/sqrt(2)])```

09. pde_fd -> fully discrete method in PDE
- Example Usage: 
```[uk] = pde_fd(1,0.25,0.25,[-0.4375,0.25,1.0625],[0,0],2)```

10. it_jacobi -> jacobi method in linear iterative method
- Example Usage: 
```[xn] = it_jacobi(A,b,x0,2)```

11. it_gs -> gauss-seidel method in linear iterative method
- Example Usage: 
```[xn] = it_gs(A,b,x0,2)```