function [Dx] = generate_Dx(n)
N = n^2; % rows num in Dx
Dx = zeros(N);

for iTer = 1:N
    l = iTer;
    d = n;
    if (iTer > n && iTer <= N-n)
        d = d + n;
        l = l - n;
    elseif (iTer > N-n)
        l = l - n;
    end
    v = zeros(1,N);  
    v(l) = -1; 
    v(l+d) = 1;
    Dx(iTer,:) = v;
end

end