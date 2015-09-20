clear all
close all
clc

a = input('Ingrese valor del coeficiente a: ');
b = input('Ingrese valor del coeficiente b: ');
c = input('Ingrese valor del coeficiente c: ');

if(a == 0 && b ~= 0)
    fprintf('El coeficiente del termino cuadratico es nulo. La ecuacion es lineal.\n');
    disp('La raiz de la ecuacion b*x + c = 0 es :');
    fprintf('X[1] = %2.6f.\n', -c/b);

elseif(a == 0 && b == 0)
    fprintf('Los coefcientes de los terminos cuadratico y lineal son nulos.\n');
    fprintf('La ecuacion no se puede resolver\n');

else
    delta = b^2 - 4*a*c;

    disp('Las raices de la ecuacion a*x^2 + b*x + c = 0 son :');

    if(delta == 0)
        fprintf('X[1] = %2.6f\n', -b/(2*a));
        fprintf('X[2] = %2.6f\n', -b/(2*a));

    elseif(delta > 0)
        ra = -b/(2*a);
        ir = sqrt(delta)/(2*a);

        if(ra == 0)
            fprintf('X[1] = + %2.6f\n', ir);
            fprintf('X[2] = - %2.6f\n', ir);
        else
            fprintf('X[1] = %2.6f + %2.6f\n', ra, ir);
            fprintf('X[2] = %2.6f - %2.6f\n', ra, ir);
        end
    else
        re = -b/(2*a);
        im = sqrt(-delta)/(2*a);

        if(ra == 0)
            fprintf('X[1] = + %2.6f\n', im);
            fprintf('X[2] = - %2.6f\n', im);
        else
            fprintf('X[1] = %2.6f + %2.6f\n', re, im);
            fprintf('X[2] = %2.6f - %2.6f\n', re, im);
        end
    end
end
