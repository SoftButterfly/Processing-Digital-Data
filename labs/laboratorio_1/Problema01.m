clear all
close all
clc
Dim      = input('Ingrese la dimension de la matriz: ');
FileName = sprintf('matriz_%d.dat',Dim);

A = magic(Dim);

MagicFile = fopen(FileName,'w');
fprintf(MagicFile,'%d\n',A);
fclose(MagicFile);

MagicFile = fopen(FileName,'r');
B = fscanf(MagicFile,'%d');
fclose(MagicFile);

disp('Matriz creada  :');
disp(A);
MAX = max(B);

[i, j] = find(A == MAX, 1, 'first');
fprintf('Mayor elemento esta en la posicion (%d,%d) y es %d\n', i, j, MAX);
