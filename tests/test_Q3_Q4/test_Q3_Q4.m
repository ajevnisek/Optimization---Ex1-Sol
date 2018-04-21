%Applying partial derivatives along the horizontal and vertical dimensions
%%
addpath('../Q3/');
addpath('../Q4/');
%% test Dx Dy
n = 25;
A = 1:n;
A = repmat(A, n, 1);
%% naive way :
tic
Dx = generate_Dx(n);
Dy = generate_Dy(n);
B = Dx*A(:);
C = Dy*A(:);
B = reshape(B, size(A));
C = reshape(C, size(A));
t_naive = toc;
disp(['The naive way took = ',num2str(t_naive*1e3),'[mSec]'])


%% smart computation :
tic
B = apply_Dx_onX(A);
C = apply_Dy_onX(A);
t_smart = toc;
disp(['The smart way took = ',num2str(t_smart*1e3),'[mSec]'])
%%
figure;
subplot(1,3,1); imagesc(A); colorbar; title('A');
subplot(1,3,2); imagesc(B); colorbar;title('B');
subplot(1,3,3); imagesc(C); colorbar;title('C');
A2 = A';
% B = Dx*A2(:);
% C = Dy*A2(:);
% B = reshape(B, size(A2));
% C = reshape(C, size(A2));
B = apply_Dx_onX(A2);
C = apply_Dy_onX(A2);
figure;
subplot(1,3,1); imagesc(A2); colorbar; title('A');
subplot(1,3,2); imagesc(B); colorbar;title('B');
subplot(1,3,3); imagesc(C); colorbar;title('C');
%%

%% question4
load('../website_material/X1.mat')
load('../website_material/X2.mat')
load('../website_material/X3.mat')
%%
plot_X_deriv(X1);
plot_X_deriv(X2);
plot_X_deriv(X3);