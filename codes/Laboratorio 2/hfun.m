function f = hfun(x)
switch (nargin)
    case 1
        f = ((mod(floor(x),2) == 0).*1 + ...
            (mod(floor(x),2) == 1).*(floor(x)-x + 1)).*...
            (-2<x & x<2);
    otherwise
        fprintf('Error: Revise los argumentos de entrada\n')
end