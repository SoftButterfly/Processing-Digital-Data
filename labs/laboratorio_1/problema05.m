clear all
close all
clc

i   = 1;
J   = 0;
D   = 0;
M   = 0;
B   = 0;
Lim = 355;
DpM = [31 28 31 30 31 30 31 31 30 31 30 31];

fprintf('Calculo del dia Juliano y Fecha\n');
fprintf('1. Conversion de Fecha a Dia Juliano\n');
fprintf('2. Conversion de Dia Juliano a Fecha\n');
Opt = input('Elija una opcion: ');

if(Opt ~= 1 && Opt ~= 2)
    fprintf('Error: Opcion no disponible');

else
    fprintf('\n');
    fprintf('Calculo del dia Juliano y Fecha\n');
    Y = input('ingrese ano: ');

    if rem(Y,4)==0 && (rem(Y,100)~=0 || rem(Y,400)==0)
        DpM(2) = 29;
        B = 1;
        Lim = 356;
    end

    if(Opt == 2)
        while (J > Lim || 1 > J)
            J = input('introduzca la fecha juliana: ');
            D = J;
        end

        while D > 0
            D = D - DpM(i);
            i = i + 1;
        end

        fprintf('\n');
        fprintf('La Fecha corresponde al dia juliano %d del ano %d es el %d/%d/%d\n', J, Y, D + DpM(i-1), i-1, Y);

    else
        while(M > 12 || 1 > M)
            M = input('ingrese mes: ');
        end

        while(D > DpM(M) || 1 > D)
            D = input('ingrese dia: ');
        end

        while i < M
            J = J + DpM(i);
            i = i + 1;
        end
        J = J + D;

        fprintf('\n');
        fprintf('El dia juliano correspondiente a la fecha %d/%d/%d es %d\n',D,M,Y,J);
    end
end
