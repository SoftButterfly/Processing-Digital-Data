clear
clc
A =10;
[x,y]=meshgrid(-10:0.2:10);
z=A*exp(-x.^2-y.^2);
mesh(x,y,z)
title('Funcion Gaussina Grid 0.2')