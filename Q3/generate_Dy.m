function [Dy] = generate_Dy(n)
N = n^2; % rows num in Dy
Dy = zeros(N);

for iTer = 1:N
    l = iTer - 1;
    d = 2;
    if (mod(iTer, n) == 1)
        d = 1;
        l = iTer;
    elseif (mod(iTer,n) == 0)
        l = iTer - 1;
        d = 1;
    end
    v = zeros(1,N);  
    v(l) = -1; 
    v(l+d) = 1;
    Dy(iTer,:) = v;
end

end