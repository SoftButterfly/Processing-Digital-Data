function sistemaecuaciones
clear all
clc
A=input('Ingrese la Matriz de coeficientes=');
B=input('Ingrese el vector columna =');
save coef.txt A  -ascii
save vec.txt B  -ascii
load ('coef.txt')
load ('vec.txt')
if (det(A)~=0)
    X=inv(A)*B;
    fprintf('Las oluciones son %6.5f/n',X)
    save solucion.txt X -ascii
else
    fprintf('%s','El sistema no presenta soluciones')
end
end
