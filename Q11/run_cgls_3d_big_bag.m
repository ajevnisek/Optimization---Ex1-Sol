clc;
clear all;
close all;
clc;
%% compute cgls :
% we wish to solve Ax = y.
tic
addpath('../Q10');
load('../../website_material/Large/A.mat');
load('../../website_material/Large/y.mat');
% y = full(Y(Y~=0));
t_load = toc;
disp(['The load of files took : ',num2str(t_load/1e-3),'[msec]']);
%%
% A = generate_A_for_toy();
tic
n = 49;
Dx = generate_Dx_for_3d(n);
Dy = generate_Dy_for_3d(n);     
Dz = generate_Dz_for_3d(n);     
L = [Dx;Dy;Dz];
lambda = 100*1e-5;
lambda2 = 0*1e-4;
t_gen_pd = toc;
disp(['The generation and stacking of the partial derivatives took : '...
    ,num2str(t_gen_pd/1e-3),'[msec]']);
%% prep for alg
tic
y_for_alg = [y; zeros(size(L,1),1)];
A_for_alg = [A + lambda2*speye(size(A)); sqrt(lambda)*L];
b_for_alg = -(A_for_alg')*y_for_alg;

% initial cond
x0 = zeros(size(A_for_alg,2),1);
g0 = -b_for_alg; % true only for x0 = zeros.
d0 = -g0;
maxIterations = length(x0);
epsilon = 1e-6;
t_prep_for_alg = toc;
disp(['The preperation of vectors to the alg took : ',...
    num2str(t_prep_for_alg/1e-3),'[msec]']);%%
%% running cgls
tic;
x_star_cgls = cgls(A_for_alg, b_for_alg, x0, y_for_alg, maxIterations, epsilon, d0);
t_small_bag = toc ;
disp(['CGLS for the Large bag took : ',num2str(t_small_bag/1e-3),'[msec]'])
%% evaluating performance :
y_cgls = A_for_alg*x_star_cgls;
e = y_cgls - y_for_alg;
Ee = sqrt(sum(e.^2));
Ex = sqrt(sum(y_for_alg.^2));
disp(['Ee = ',num2str(Ee)]);
disp(['Ee/Ey = ',num2str(Ee/Ex)]);
disp(['Ee/Ey [%] = ',num2str(100*Ee/Ex)]);
%% displaying the small bag :
X = reshape(x_star_cgls, [n n n]);
addpath('../../website_material');
[x, y, z] = meshgrid(1:n, 1:n, 1:n);
figure;
slice(x, y, z, X, 7:7:n, 25, 1:25:49)

%%
figure;
displayVolumeSliceGUI;
%%