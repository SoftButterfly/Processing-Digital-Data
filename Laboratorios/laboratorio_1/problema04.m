clear all
close all
clc

Lat = 1;
Lon = 2;
R   = 3;

Deg = 1;
Min = 2;
Sec = 3;

X   = 1;
Y   = 2;
Z   = 3;

Rt  = 6371.0;
City1 = zeros(3:3);
City2 = zeros(3:3);

fprintf('Ingrese las coordenadas geograficas de las ciudades\n');
fprintf('Las latitudes hacia el norte y longitudes hacia el este se ingresan con numeros positivos\n');
fprintf('Las latitudes hacia el sur y longitudes hacia el oeste se ingresan con numeros negativos\n');

fprintf('Ciudad 1:\n')
fprintf('* Latitud\n')
City1(Lat,Deg) = input('  * Grados   : ');
City1(Lat,Min) = input('  * Minutos  : ');
City1(Lat,Sec) = input('  * Segundos : ');
fprintf('* Longitud\n')
City1(Lon,Deg) = input('  * Grados   : ');
City1(Lon,Min) = input('  * Minutos  : ');
City1(Lon,Sec) = input('  * Segundos : ');

fprintf('Ciudad 2:\n')
fprintf('* Latitud\n')
City2(Lat,Deg) = input('  * Grados   : ');
City2(Lat,Min) = input('  * Minutos  : ');
City2(Lat,Sec) = input('  * Segundos : ');
fprintf('* Longitud\n')
City2(Lon,Deg) = input('  * Grados   : ');
City2(Lon,Min) = input('  * Minutos  : ');
City2(Lon,Sec) = input('  * Segundos : ');

Rlat = (City1(Lat,Deg) + City1(Lat,Min)/60 + City1(Lat,Sec)/3600)*pi/180;
Rlon = (City1(Lon,Deg) + City1(Lon,Min)/60 + City1(Lon,Sec)/3600)*pi/180;

City1(R,X) = Rt*cos(Rlat)*cos(Rlon);
City1(R,Y) = Rt*cos(Rlat)*sin(Rlon);
City1(R,Z) = Rt*sin(Rlat);

Rlat = (City2(Lat,Deg) + City2(Lat,Min)/60 + City2(Lat,Sec)/3600)*pi/180;
Rlon = (City2(Lon,Deg) + City2(Lon,Min)/60 + City2(Lon,Sec)/3600)*pi/180;

City2(R,X) = Rt*cos(Rlat)*cos(Rlon);
City2(R,Y) = Rt*cos(Rlat)*sin(Rlon);
City2(R,Z) = Rt*sin(Rlat);

D = Rt*acos((City1(R,:)*City2(R,:)')/(norm(City1(R,:))*norm(City2(R,:))));
fprintf('La distancia entre ambos puntos es igual a %.4f km\n', D);

