clear all
close all
clc
Question = {'1. Numero de ecuaciones del sistema:'
            '2. Nombre del archivo entrada:'
            '3. Nombre del archivo salida:'};
Title    = 'Sistema Lineal';
Default  = {'10','Data_System.dat','Solution_System.dat'};
UInData  = inputdlg(Question, Title, 1, Default);

Dim      = str2double(UInData{1});
InFile   = UInData{2};
OutFile  = UInData{3};

DataFile = fopen(InFile,'r');

if(DataFile == -1)
    disp('Archivo no encontrado');
else
    B = fscanf(DataFile,'%f');
    fclose(DataFile);
    
    if(length(B) < Dim^2 + Dim)
        fprintf('Datos insuficientes en "%s"\n', InFile);
    else
        if(length(B) > Dim^2 + Dim)
            fprintf('Exceso de datos en "%s", se tomaran solo los %d primeros datos.\n', InFile, Dim^2 + Dim);
        end
        A = zeros(Dim,Dim + 1);
        for i = 1:Dim
            for j = 1:Dim+1
                A(i,j) = B(i+j+Dim*(i-1)-1);
            end
        end
        disp('Matiz del sistema: A·X = Y')
        disp('A = ')
        for i = 1:Dim
            for j = 1:Dim
                fprintf('\t %10.4f', A(i,j));
                if j == Dim
                    fprintf('\n');
                end
            end
        end
        disp(' ')
        disp('Y = ')
        
        for i = 1:Dim
            fprintf('\t %10.4f \n', A(i,Dim));
        end
        
        disp(' ')
        
        if(det(A(:,1:Dim)) == 0)
            disp('La matriz del sistema es singular')
        else
            X = A(:,Dim+1)\A(:,1:Dim);
            disp('La solucion del sistema es:')
            disp('X = ')
            
            SolutionFile = fopen(OutFile,'w');
            for i = 1:Dim
                fprintf('\t %10.4f \n', X(i));
                fprintf(SolutionFile, '%2.4f\n', X(i));
            end
            
            if(~fclose(SolutionFile))
                fprintf('\nLa solucion del problema sistema se guardo exitosamente en "%s"\n',...
                         OutFile);
            else
                fprintf('\nError al guardar la solucion en "%s"\n',...
                         OutFile);
            end
        end
    end
end
