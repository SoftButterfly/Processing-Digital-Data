clear all
clc
fprintf('Teniendo las siguientes funciones singulares : \n1)Impulso unitario d(t)\n2)Escalon unitario u(t)\n3)Funcion rampa r(t)');
f=input('\nSeleccione la funcion que desee graficar : ');
if (f~=1 & f~=2 & f~=3)
    fprintf('No ha seleccionado una de las funciones mencionadas\n');
else
    t=-10:0.01:10;
    switch (f)
        case 1
            y=d(t);
        case 2
            y=u(t);
        case 3
            y=r(t);
    end
    plot (t,y), grid on, axis equal
end