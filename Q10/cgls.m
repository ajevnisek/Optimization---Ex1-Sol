function [x_star] = cgls(A, b, x0, y, maxIterations, epsilon, d0)
%% iterations initializations
iTer = 1;
converged = false;
%% inner verctors and scalars
alpha = 0;
old_d = d0;
old_g = -d0;
old_x = x0;
old_s = A * x0 - y;

new_x = 0;
new_g = 0;
dg = 0;
%%
A_transposed = (A');
%% main loop
while ((iTer < maxIterations) && ~converged)
    A_old_d = A*old_d;
    %% check if converged : 
    if((A_old_d'*A_old_d < epsilon))
        converged = true;
        disp('Converged !');disp(['iTer = ',num2str(iTer - 1)]);
        break;
    end
    %% continue computations :
    alpha = -(old_d'*old_g) /(A_old_d'*A_old_d);
    new_x = old_x + alpha * old_d;
    new_s = old_s + alpha * A_old_d;
    new_g = A_transposed * new_s;
    dg = (new_g - old_g);
    beta = (new_g'*dg)/(old_d'*dg);
    new_d = -new_g + beta * old_d;
   
    %% reversing new and old before next iteration
    old_d = new_d;
    old_s = new_s;
    old_g = new_g;
    old_x = new_x;
    %%
    iTer = iTer + 1;
end
if (~converged)
    disp(['Reached maximal number of iterations = ',num2str(iTer - 1),...
        ' without converging'])
end
x_star = new_x;

end