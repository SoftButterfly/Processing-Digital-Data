clear all
close all
clc

Dim = input('Ingrese la dimension de la matriz: ');

FileName = sprintf('magico_%d.dat',Dim);
MagicMatrix = magic(Dim);

fprintf('Escribiendo archivo %s\n', FileName

save(FileName, 'MagicMatrix', '-ascii')

fprintf('Escritura completa.\n')
fprintf('La matriz guardada fue:\n')
disp(MagicMatrix)
