function f = rampa(x,y,z)
    switch (nargin)
        case 1, f = x.*(x>=0);
        case 2, f = (x-y).*(x>=y);
        case 3, f = z*(x-y).*(x>=y);
        otherwise
            fprintf('Error: Revise los argumentos de entrada')
end
