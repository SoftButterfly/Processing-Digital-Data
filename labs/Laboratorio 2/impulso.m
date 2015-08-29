function f = impulso(x,y,z)

switch (nargin)
    case 1, f = 1.*(x>-eps)-1.*(x>eps);
    case 2, f = 1.*(x>(y-eps))-1.*(x>(y+eps));
    case 3, f = z.*(x>(y-eps))-z.*(x>(y+eps));
    otherwise
        fprintf('Error: Revise lor argumentos de entrada')
end