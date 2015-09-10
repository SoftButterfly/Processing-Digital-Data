clear all
close all
clc

Dim = input('Ingrese la dimension de la matriz: ');

FileName = sprintf('magico_%d.dat',Dim);

fprintf('Leyendo archivo %s\n', FileName);

MagicMatrix = load(FileName);
maxValue = max(max(MagicMatrix));
[r, c] = find(MagicMatrix == maxValue, 1, 'first');

fprintf('Mayor elemento esta en la posicion (%d,%d) y es %d\n', r, c, maxValue);
fprintf('La matriz cargada fue:\n')
disp(MagicMatrix)
