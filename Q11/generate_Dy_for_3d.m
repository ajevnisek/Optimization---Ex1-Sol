function [Dy] = generate_Dy_for_3d(n)
% addpath('../Q3');
% Dx_2d = generate_Dx(n);
N = n^2;
% Dy_2d = zeros(N);
Dy_2d = sparse(N,N); %generates an N-by-N all zero sparse matrix.
start_idx = 1;
step = 1;

for line = 1:n^2
    if (0 ~= mod(line,n))
        Dy_2d(line,start_idx) = -1;
        Dy_2d(line,start_idx + step) = 1;
    end
    start_idx = start_idx + 1;
end
Dy_2d_Cell = repmat({Dy_2d},1,n);
Dy = blkdiag(Dy_2d_Cell{:});
end