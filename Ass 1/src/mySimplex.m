% could possibly be simplified more with myBasics()
function [solution, maybeSol] = mySimplex(m, n, c, b, A)
    A = [A eye(m)]; 
    Basic = n+1 : n+m; nonBasic = 1 : n;
    
    AbM = (A(:, Basic)) \ (A(:, nonBasic));
    
    c = [c; zeros(m,1)]; cn = c(nonBasic) - (AbM)' * c(Basic);
    x_Basic = (A(:, Basic)) \ b;
    
    iterationCount = 0;
    maxIterationCounts = nchoosek(m+n, m);
    while any(cn > 0)
        [~, j ] = max(cn); enterColumn = AbM(:, j);
        [~, i] = max(enterColumn./x_Basic);
        temp = nonBasic(j); nonBasic(j) = Basic(i); Basic(i) = temp;
        Basic = sort(Basic); nonBasic = sort(nonBasic);
        
        AbM = (A(:, Basic)) \ (A(:, nonBasic));
        
        cn = c(nonBasic) - (AbM)' * c(Basic); x_Basic = (A(:, Basic)) \ b;
        iterationCount = iterationCount + 1;
        if iterationCount == maxIterationCounts
            break;
        end
    end
    
    x = zeros(n+m,1); x(Basic) = x_Basic;
    oX = x(1:n); oA = A(:, 1:n);
    
    if all(oA * oX <= b)
        solution = true; maybeSol = oX;
    else
        solution = false; maybeSol = [];
    end
end