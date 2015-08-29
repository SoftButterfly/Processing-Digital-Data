clear all
close all 
clc

fprintf('Gráfica de Funciones\n');
fprintf('Función Grausiana z(x,y) = Aexp(- (x^2 + y^2)) en [-10,10]x[-10,10]\n');
A = input('Ingrese la amplitud         : ');
N = input('Ingrese el numero de puntos : ');
fprintf(  'Amplitud de la malla        : %.5f\n', 20/(N-1));

X = linspace(-10,10,N);
Y = linspace(-10,10,N);
[X,Y] = meshgrid(X,Y);
Z = A*exp(-(X.^2 + Y.^2));
str1 = sprintf('Superficie z(x,y)  = %.3f*exp(-(x^2 + y^2))',A);

surf(X,Y,Z,'EdgeColor','none');
title (str1);

C = input('Desea graficar curvas de nivel (Y/N)? ');

if(C == 'Y' || C == 'y')
    close all
    str2 = sprintf('%d Curvas de Nivel ', floor(N/3));
    subplot(1,2,1);
    surf(X,Y,Z,'EdgeColor','none');
    title (str1);
    subplot(1,2,2);
    contourf(X,Y,Z,floor(N/3));
    title (str2);
end



