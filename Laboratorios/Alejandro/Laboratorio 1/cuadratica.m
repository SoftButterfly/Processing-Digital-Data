function cuadratica
clear all
clc
fprintf ('Sea la ecuacion cuadratica ax^2 + bx +c =0');
a=input ('\nIngrese a : ');
b=input ('Ingrese b : ');
c=input ('Ingrese c : ');
if (a==0)
    x=-c/b;
    fprintf ('%s %8.6f\n','Ecuacion lineal sin termino cuadratico con x=',x);
else 
    d=b*b-4*a*c;
    f=sqrt(d)/(2*a);
    e=-b/(2*a);
    if (d==0)
        fprintf('Tiene solucion unica con x= %2.6f\n', e);
    else if (d>0)
        disp('Tiene soluciones reales');
        x1=e+f; 
        fprintf ('%s %8.6f\n','x1=',x1);
        x2=e-f;
        fprintf ('%s %8.6f\n','x2=',x2);
        else (d<0)
         g=sqrt(-d)/(2*a);
         disp('Tiene soluciones complejas');  
         fprintf( 'x1 = %2.5f + %2.5f*i\n', e, g);
         fprintf( 'x2 = %2.5f - %2.5f*i\n', e, g);
        end
    end
end
end