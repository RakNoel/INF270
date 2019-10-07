function [xb, xn] = myBasics(B, m, n, b, A)
    A = [A eye(m)];
    AB = A(:,B);
    xb = AB\b;
    xn = zeros(n,1);
end