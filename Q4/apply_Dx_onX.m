function [DxX] = apply_Dx_onX(X)

Xleft = [X(:,1) X(:,1:end-1)];
Xright = [X(:,2:end) X(:,end)];
DxX = Xright - Xleft;

end