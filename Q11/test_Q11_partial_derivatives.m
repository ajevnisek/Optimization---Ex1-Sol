clear all; close all; clc;
%%
n = 5;
N = n^3;
a = (1:N)';
A = reshape(a,[n n n]);
% 
Dx = generate_Dx_for_3d(n);
a_filtered_x = Dx*a;
A_filtered_x = reshape(a_filtered_x,[n n n]);
% 
Dy = generate_Dy_for_3d(n);
a_filtered_y = Dy*a;
A_filtered_y = reshape(a_filtered_y, [n n n]);
%
Dz = generate_Dz_for_3d(n);
a_filtered_z = Dz*a;
A_filtered_z = reshape(a_filtered_z,[n n n]);
%%
figure; 
subplot(2,2,1);
slice(x, y, z, A, 1:5, [2,4],[1,3]); colorbar
title('Our Base Cube'); xlabel('x');ylabel('y');zlabel('z');
subplot(2,2,2);
slice(x, y, z, A_filtered_x,1:5, [2,4],[1,3]); colorbar;
title('Dx*a : partial derivative along the horizontal axis'); xlabel('x');ylabel('y');zlabel('z');
subplot(2,2,3);
slice(x, y, z, A_filtered_y,1:5, [2,5],[1,3]); colorbar;
title('Dy*a : partial derivative along the vertical axis'); xlabel('x');ylabel('y');zlabel('z');
subplot(2,2,4);
slice(x, y, z, A_filtered_z,1:5, [2,4],[1 3 5]); colorbar;
title('Dz*a : partial derivative along the depth of the matrix'); xlabel('x');ylabel('y');zlabel('z');

%%
figure;
[x, y, z] = meshgrid(1:n,1:n,1:n);
slice(x, y, z, A,1:5, [2,4],3); colorbar
title('Our Base Cube'); xlabel('x');ylabel('y');zlabel('z');
%%
figure;
subplot(2,3,1); imagesc(A(:,:,1)); colorbar; 
subplot(2,3,2); imagesc(A(:,:,2)); colorbar;
title('A - the base matrix')
subplot(2,3,3); imagesc(A(:,:,3)); colorbar;
subplot(2,3,4); imagesc(A(:,:,4)); colorbar;
subplot(2,3,5); imagesc(A(:,:,5)); colorbar;
%%
figure;
[x, y, z] = meshgrid(1:n,1:n,1:n);
slice(x, y, z, A_filtered_x,1:5, [2,4],3); colorbar;
title('Dx*a : partial derivative along the horizontal axis'); xlabel('x');ylabel('y');zlabel('z');
%%
figure;
subplot(2,3,1); imagesc(A_filtered_x(:,:,1)); colorbar; 
subplot(2,3,2); imagesc(A_filtered_x(:,:,2)); colorbar;
title('Dx*a : partial derivative along the horizontal axis')
subplot(2,3,3); imagesc(A_filtered_x(:,:,3)); colorbar;
subplot(2,3,4); imagesc(A_filtered_x(:,:,4)); colorbar;
subplot(2,3,5); imagesc(A_filtered_x(:,:,5)); colorbar;
%%
figure;
[x, y, z] = meshgrid(1:n,1:n,1:n);
slice(x, y, z, A_filtered_y,1:5, [2,5],3); colorbar;
title('Dy*a : partial derivative along the vertical axis'); xlabel('x');ylabel('y');zlabel('z');

%%
figure;
subplot(2,3,1); imagesc(A_filtered_y(:,:,1)); colorbar; 
subplot(2,3,2); imagesc(A_filtered_y(:,:,2)); colorbar;
title('Dy*a : partial derivative along the vertical axis')
subplot(2,3,3); imagesc(A_filtered_y(:,:,3)); colorbar;
subplot(2,3,4); imagesc(A_filtered_y(:,:,4)); colorbar;
subplot(2,3,5); imagesc(A_filtered_y(:,:,5)); colorbar;
%%
figure;
[x, y, z] = meshgrid(1:n,1:n,1:n);
slice(x, y, z, A_filtered_z,1:5, [2,4],[3 5]); colorbar;
title('Dz*a : partial derivative along the depth of the matrix'); xlabel('x');ylabel('y');zlabel('z');

%%

figure;
subplot(2,3,1); imagesc(A_filtered_z(:,:,1)); colorbar; 
subplot(2,3,2); imagesc(A_filtered_z(:,:,2)); colorbar;
title('Dz*a : partial derivative along the depth of the matrix')
subplot(2,3,3); imagesc(A_filtered_z(:,:,3)); colorbar;
subplot(2,3,4); imagesc(A_filtered_z(:,:,4)); colorbar;
subplot(2,3,5); imagesc(A_filtered_z(:,:,5)); colorbar;