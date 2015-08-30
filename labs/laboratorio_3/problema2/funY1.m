function f = funY1( t )
switch( nargin )
    case 1, f = (1.*(1 >= t & t >= 0 ) + (2-t).*(2 >= t & t > 1 )).*(2 >= t & t >= 0 );
    otherwise, printf('Revise los argumentos de entrada\n')
end