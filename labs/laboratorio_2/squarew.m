function f = squarew(x,y,z,w)
switch (nargin)
    case 1, f = 1.*(mod(floor(x),2) == 0);
    case 2, f = 1.*(mod(floor(y*x),2) == 0);
    case 3, f = z.*(mod(floor(y*x),2) == 0);
    case 4, f = z.*(mod(floor(y*x + w),2) == 0);
    otherwise
        fprintf('Error: Revise los argumentos de entrada\n')
end