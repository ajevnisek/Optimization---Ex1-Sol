clc;
clear all;
close all;
clc;
%% compute cgls :
% we wish to solve Ax = y.
load('../../website_material/Y.mat');
y = full(Y(Y~=0));

%%
A = generate_A_for_toy();
n = 5;
Dx = generate_Dx(n);
Dy = generate_Dy(n);
L = [Dx;Dy];
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
maxIterations = length(x0);
epsilon = 1e-6;
%%
tic
x_star_cgls = cgls(A_for_alg, b_for_alg, x0, y_for_alg, maxIterations, epsilon, d0);
t_toy = toc ;
disp(['CGLS for the toy exmaple took : ',num2str(t_toy/1e-3),'[msec]'])
%%
y_cgls = A_for_alg*x_star_cgls;
e = y_cgls - y_for_alg;
Ee = sqrt(sum(e.^2));
Ex = sqrt(sum(y_for_alg.^2));
disp(['Ee = ',num2str(Ee)]);
disp(['Ee/Ey = ',num2str(Ee/Ex)]);
