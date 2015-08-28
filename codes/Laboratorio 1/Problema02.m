clear all
close all
clc
a = input('Ingrese valor del coeficiente a: ');
b = input('Ingrese valor del coeficiente b: ');
c = input('Ingrese valor del coeficiente c: ');

R = roots([a b c]);

disp('Las raices de la ecuación a*x^2 + b*x + c = 0 son :');

if(imag(R(1))<0)
    R(1) = conj(R(1));
    fprintf('X[1] = %2.6f - %2.6f*i\n',real(R(1)),imag(R(1)));
    fprintf('X[2] = %2.6f + %2.6f*i\n',real(R(2)),imag(R(2)));
else
    if (imag(R(1)) == 0)
        fprintf('X[1] = %2.6f\n',R(1));
        fprintf('X[2] = %2.6f\n',R(2));
    else
        R(2) = conj(R(2));
        fprintf('X[1] = %2.6f + %2.6f*i\n',real(R(1)),imag(R(1)));
        fprintf('X[2] = %2.6f - %2.6f*i\n',real(R(2)),imag(R(2)));
    end
end
