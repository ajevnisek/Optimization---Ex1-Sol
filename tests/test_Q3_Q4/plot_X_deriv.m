function [] = plot_X_deriv(X)
n = size(X,2);
DxX = apply_Dx_onX(X);
DyX = apply_Dy_onX(X);
G = sqrt(DxX.^2 + DyX.^2);
figure;
subplot(2,2,1); imagesc(X); colorbar; title('X');
subplot(2,2,2); imagesc(DxX); colorbar;title('D_{x}X');
subplot(2,2,3); imagesc(DyX); colorbar;title('D_{y}X');
subplot(2,2,4); imagesc(G); colorbar;title('G');


end