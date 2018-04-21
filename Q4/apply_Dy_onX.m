function [DyX] = apply_Dy_onX(X)

Xdown = [X(1,:); X(1:end-1,:)];
Xup = [X(2:end,:); X(end,:)];
DyX = Xup - Xdown;

end