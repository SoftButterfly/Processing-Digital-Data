clear all
close all
clc

Dim      = input('1. Numero de ecuaciones del sistema: ');
InFile   = input('2. Nombre del archivo entrada: ', 's');
OutFile  = input('3. Nombre del archivo salida: ', 's');

fprintf('\n')

if(isempty(Dim))
    Dim = 5;
    fprintf('* Cargando valor por defecto: %d ecuaciones\n', Dim);
end

if(isempty(InFile))
    InFile = 'problema03_data.dat';
    fprintf('* Cargando valor por defecto: Archivo de entrada "%s".\n', InFile);
end

if(isempty(OutFile))
    OutFile = 'solucion.txt';
    fprintf('* Cargando valor por defecto: Archivo de salida "%s".\n', OutFile);
end

if(InFile == -1)
    fprintf('\n')
    disp('Archivo no encontrado');
else
    B = load(InFile);

    if(any(size(B) ~= [Dim, Dim+1]))
        fprintf('\n')
        fprintf('Los datos en el archivo "%s" no corresponden a un sistem de %d ecuaciones.\n', InFile, Dim);
    else
        A = B(:,1:Dim);

        fprintf('\n')
        fprintf('Matiz del sistema: A*X = Y\n')
        fprintf('A = \n')

        for i = 1:Dim
            for j = 1:Dim
                fprintf('\t %10.4f', A(i,j));
            end
            fprintf('\n');
        end

        Y = B(:,Dim+1);

        fprintf('\n')
        fprintf('Y = \n')

        for i = 1:Dim
            fprintf('\t %10.4f \n', Y(i));
        end

        if(det(A) == 0)
            fprintf('\n');
            fprintf('La matriz del sistema es singular.\n')
        else
            X = A\Y;

            fprintf('\n');
            fprintf('La solucion del sistema es:\n')
            fprintf('X = \n')

            SolutionFile = fopen(OutFile,'w');

            for i = 1:Dim
                fprintf('\t %10.4f \n', X(i));
                fprintf(SolutionFile, '%2.4f\n', X(i));
            end

            if(~fclose(SolutionFile))
                fprintf('\n');
                fprintf('La solucion del problema sistema se guardo exitosamente en "%s"\n', OutFile);
            else
                fprintf('\n');
                fprintf('Error al guardar la solucion en "%s"\n', OutFile);
            end
        end
    end
end
