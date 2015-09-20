function gaussiana
clear all
clc
g=input('Ingrese el valor de grid que desea aplicar : ');
n=input('Desea las curvas de nivel?(1=y/2=n) : ');
A =10;
[x,y]=meshgrid(-10:g:10);
z=A*exp(-x.^2-y.^2);
if n=='2'
mesh(x,y,z);
else
contour(x,y,z);    
title('Fuction Gaussina');
end