s=2;
while (s==2)
clear all
clc
fprintf('Funcion Compuerta Unitaria : \n\n1)Usando Comandos "zeros" y "ones" \n2)Usando las Funciones del problema 1');
f=input('\n\nSeleccione la funcion que desee graficar : ');
if (f~=1 & f~=2 )
    fprintf('No ha seleccionado una de los metodos mencionados\n');
else
    c=input ('En que punto desea centrar la compuerta? : ');
    t=(c-1.5):0.01:(c+1.5);
    switch (f)
        case 1
            y=g(t);
        case 2
            y=u(t+1/2-c)-u(t-1/2-c);
     end
    plot (t,y), grid on, axis equal
end
s=input('\n1)Salir \n2)Graficar otra funcion \n\nQue desea hacer?: ');
end
clc