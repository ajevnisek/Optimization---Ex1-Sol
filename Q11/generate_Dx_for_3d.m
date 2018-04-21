function [Dx] = generate_Dx_for_3d(n)
N = n^2;
Dx_2d = sparse(N,N); %generates an N-by-N all zero sparse matrix.
start_idx = 1;
step = n;

for line = 1:n^2-n
    Dx_2d(line,start_idx) = -1;
    Dx_2d(line,start_idx + step) = 1;
    start_idx  = start_idx + 1;

end
Dx_2d_Cell = repmat({Dx_2d},1,n);
Dx = blkdiag(Dx_2d_Cell{:});
end