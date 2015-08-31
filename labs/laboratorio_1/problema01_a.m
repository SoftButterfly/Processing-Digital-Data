clear all
close all
clc

Dim = input('Ingrese la dimension de la matriz: ');

FileName = sprintf('magico_%d.dat',Dim);
A = magic(Dim);

fprintf('Escribiendo archivo %s\n', FileName);

FileHandler = fopen(FileName,'w');

for i=1:Dim
    for j=1:Dim
        fprintf(FileHandler,'%10d',A(i,j));
    end
    fprintf(FileHandler,'\n');
end

fclose(FileHandler);
fprintf('Escritura completa.\n');
