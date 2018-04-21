function [Dz] = generate_Dz_for_3d(n)
% addpath('../Q3');
% Dx_2d = generate_Dx(n);
N2 = n^2;
N3 = n^3;

i_minus_one = 1:N3-N2;
j_minus_one = 1:N3-N2;
v_minus_one = -ones(size(i_minus_one));

i_plus_one = i_minus_one;
j_plus_one = j_minus_one + N2;
v_plus_one = ones(size(i_plus_one));

ik = [i_minus_one i_plus_one];
jk = [j_minus_one j_plus_one];
vk = [v_minus_one v_plus_one];


% the following command generates a sparse matrix S of size N3-by-N3 from
% the triplets i, j, and v such that S(i(k),j(k)) = v(k). 
Dz = sparse(ik, jk, vk, N3,N3); 


end