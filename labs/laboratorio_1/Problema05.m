clear all
clc

i   = 1;
J   = 0;
D   = 0;
M   = 0;
B   = 0;
Lim = 355;
DpM = [31 28 31 30 31 30 31 31 30 31 30 31];

fprintf('Cálculo del dia Juliano y Fecha\n');
fprintf('1. conversion de Fecha a Día Juliano\n');
fprintf('2. conversion de Día Juliano a Fecha\n');
Opt = input('Elija una opcion: ');



if(Opt ~= 1 && Opt ~= 2)
    fprintf('Error: Opción no disponible');
else
    clc
    fprintf('Cálculo del dia Juliano y Fecha\n');
    Y = input('Ingrese año: ');
    if rem(Y,4)==0 && (rem(Y,100)~=0 || rem(Y,400)==0)
        DpM(2) = 29;
        B = 1;
        Lim = 356;
    end
    
    if(Opt == 2)
        while (J > Lim || 1 > J)
            clc
            fprintf('Cálculo del dia Juliano y Fecha\n');
            fprintf('Ingrese año: %d\n',Y);
            J = input('Introduzca la fecha juliana: ');
            D = J;
        end
        
        while D > 0
            D = D - DpM(i);
            i = i + 1;
        end
        
        fprintf('La Fecha correspondie al dia juliano %d del año %d es el %d/%d/%d\n',...
                 J, Y, D + DpM(i-1), i-1, Y);
    else
        while(M > 12 || 1 > M)
            clc
            fprintf('Cálculo del dia Juliano y Fecha\n');
            fprintf('Ingrese año: %d\n',Y);
            M = input('Ingrese mes: ');
        end

        while(D > DpM(M) || 1 > D)
            clc
            fprintf('Cálculo del dia Juliano y Fecha\n');
            fprintf('Ingrese año: %d\n',Y);
            fprintf('Ingrese mes: %d\n',M);
            D = input('Ingrese dia: ');
        end

        while i < M
            J = J + DpM(i);
            i = i + 1;
        end
        J = J + D;
        fprintf('El dia juliano corrspondiente a la fecha %d/%d/%d es %d\n',D,M,Y,J);
    end
end