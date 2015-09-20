function distancia
clear all
clc
L1= input ('Ingrese la latitud de la primera ciudad : ');
M1=input ('ingrese la longitud de la primera ciudad : ');
L2= input ('Ingrese la latitud de la segunda ciudad : ');
M2=input ('ingrese la longitud de la segunda ciudad : ');
r=6371;
l1=pi*(0.5-L1/180);
l2=pi*(0.5-L2/180);
m1= pi*M1/180;
m2= pi*M2/180;
x1=r*sin(l1)*cos(m1);
x2=r*sin(l2)*cos(m2);
y1=r*sin(l1)*sin(m1);
y2=r*sin(l2)*sin(m2);
z1=r*cos(l1);
z2=r*cos(l2);
escalar= x1*x2+y1*y2+z1*z2;
ang= acos(escalar/(r^2));
L=ang*r;
fprintf('La distancia entre ambas ciudades es : %6.5f km\n',L)
end