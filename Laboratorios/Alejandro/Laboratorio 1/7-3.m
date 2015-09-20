clear
clc
A =10;
[x,y]=meshgrid(-10:1:10);
z=A*exp(-x.^2-y.^2);
contour(x,y,z)
title('Fuction Gaussina Curvas de nivel')