function f = funX1( t )
switch( nargin )
    case 1, f = (t.*(1 >= t & t >= 0 ) + (2-t).*(2 >= t & t > 1 )).*(2 >= t & t >= 0 );
    otherwise, fprintf('Revise los argumentos de entrada\n')
end