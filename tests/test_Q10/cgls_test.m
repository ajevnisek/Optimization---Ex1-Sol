%%
clc;
clear all;
close all;
clc;
addpath('../Q3/');
%%
disp(['Wikipedia Example :'])
A = [4 1; 1 3];
y = [1;2];
x0 = [0;0];
maxIterations = 3;
epsilon = 1e-4;
Q = (A')*A;
b = -A'*y;
g0 = Q*x0 + b;
d0 = -g0;
%%
tic
[x_star] = cgls(A, b, x0, y, maxIterations, epsilon, d0)
t_cgls = toc;
disp(['Our 2x2 cgls example took : ',num2str(t_cgls/1e-3),'[msec]'])
%%
x = [1/11; 7/11];
e = x_star - x;
Ee = sqrt(sum(e.^2));
Ex = sqrt(sum(x.^2));
disp(['Ee = ',num2str(Ee)]);
disp(['Ee/Ex = ',num2str(Ee/Ex)]);
%%
clear all;
%%
disp(['   ']);
disp(['Matlab 4x4 example with smoothing regularization:']);
disp(['   ']);
%%
A = magic(4) + 3*eye(4);
y = (1:4)';
x_benchmark = inv(A)*y;
n = 2;
%%
Dx = generate_Dx(n);
Dy = generate_Dy(n);
L = [Dx;Dy];
% lambda = 0;
lambda = 1e-5;
lambda2 = 0;
%%
y_for_alg = [y; zeros(size(L,1),1)];
A_for_alg = [A + lambda2*eye(size(A)); sqrt(lambda)*L];
b_for_alg = -(A_for_alg')*y_for_alg;
%%
x0 = zeros(size(A_for_alg,2),1);
g0 = -b_for_alg; % true only for x0 = zeros.
d0 = -g0;
maxIterations = length(y_for_alg);
% maxIterations = 1e4;
epsilon = 1e-6;
%%
tic
x_star_cgls = cgls(A_for_alg, b_for_alg, x0, y_for_alg, maxIterations, epsilon, d0);
t_matlab_result = toc ;
disp(['Our 4x4 + regularization took : ',num2str(t_matlab_result/1e-3),'[msec]'])
%%
e = x_star_cgls - x_benchmark;
Ee = sqrt(sum(e.^2));
Ex = sqrt(sum(x_benchmark.^2));
disp(['Ee = ',num2str(Ee)]);
disp(['Ee/Ex = ',num2str(Ee/Ex)]);
%%

