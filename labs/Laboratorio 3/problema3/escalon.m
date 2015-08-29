function f = escalon(x,y,z)

switch (nargin)
    case 1, f = 1.*(x>=0);
    case 2, f = 1.*(x>=y);
    case 3, f = z.*(x>=y);
    otherwise
        fprintf('Error: Revise lor argumentos de entrada')
end