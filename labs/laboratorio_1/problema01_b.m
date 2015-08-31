clear all
close all
clc

Dim = input('Ingrese la dimension de la matriz: ');

FileName = sprintf('magico_%d.dat',Dim);

fprintf('Leyendo archivo %s\n', FileName);

A = load(FileName);
maxA = max(max(A));
[r, c] = find(A == maxA, 1, 'first');

fprintf('Mayor elemento esta en la posicion (%d,%d) y es %d\n', r, c, maxA);
